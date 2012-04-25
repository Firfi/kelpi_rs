#include "dlib/matrix.h"
#include <tr1/memory>
#include <ctime>

namespace dlib {

	template <typename M>
	struct op_crop_cols 
	{
	    op_crop_cols(const M& m_, long first_, long last_) : m(m_), first(first_), last(last_) {}
	    const M& m;
		const long first;
		const long last;
		

	    typedef typename M::const_ret_type const_ret_type;
	    typedef typename M::type type;

	    const static long cost = M::cost;
	    const static long NC = 0;
	    const static long NR = 0;
	
	    typedef typename M::mem_manager_type mem_manager_type;
	    typedef typename M::layout_type layout_type;

	    const_ret_type apply ( long r, long c) const
	    { 
			return m(r+first,c);
	    }

	    type apply ( long r, long c)
		{
			return m(r+first,c);
		}

		long nr () const { return last-first; }
		long nc () const { return m.nc(); }

	    template <typename U> bool aliases               ( const matrix_exp<U>& item) const 
		{ return m.aliases(item); }
	    template <typename U> bool destructively_aliases ( const matrix_exp<U>& item) const 
	    { return m.aliases(item); }
	};
	template <
        typename EXP
        >
    inline const matrix_op<op_crop_cols<EXP> > crop_cols (
        const matrix_exp<EXP>& e,
		const long first,
		const long last
    )
    {
        typedef op_crop_cols<EXP> op;
        return matrix_op<op>(op(e.ref(), first, last));
    };

	template <typename M>
		struct op_munfold
		{
		    op_munfold(const M& m_, const long& offset_, const long& rows_, const long& columns_) : m(m_), offset(offset_), rows(rows_), columns(columns_) {}
		    const M& m;
		    const long offset;
			const long rows;
			const long columns;


		    typedef typename M::const_ret_type const_ret_type;
		    typedef typename M::type type;

		    const static long cost = M::cost + 2;
		    const static long NC = 0;
		    const static long NR = 0;

		    typedef typename M::mem_manager_type mem_manager_type;
		    typedef typename M::layout_type layout_type;

		    const_ret_type apply ( long r, long c) const
		    {
		    	const long idx = r*columns + c;
				return m(idx/m.nc() + offset, idx%m.nc());
		    }

			long nr () const { return rows; }
			long nc () const { return columns; }

		    template <typename U> bool aliases               ( const matrix_exp<U>& item) const
			{ return m.aliases(item); }
		    template <typename U> bool destructively_aliases ( const matrix_exp<U>& item) const
		    { return m.aliases(item); }
		};
		template <
	        typename EXP
	        >
	    inline const matrix_op<op_munfold<EXP> > munfold (
	        const matrix_exp<EXP>& e,
	        const long& offset_,
	        const long& rows_,
	        const long& columns_
	    )
	    {
	        typedef op_munfold<EXP> op;
	        return matrix_op<op>(op(e.ref(), offset_, rows_, columns_));
	    };

}


namespace com_firfi {
	using dlib::matrix;
	using dlib::matrix_exp;
	using std::tr1::shared_ptr;
	using dlib::pointwise_multiply;
	using dlib::trans;
	using std::cout;
	using std::endl;
	typedef shared_ptr<matrix<double> > matrix_ptr;
	typedef shared_ptr<const matrix<double> > matrix_ptr_const;
    


    
	template<typename T>
	class GDFunc {
	public:
		GDFunc(T Y_, T R_, double lambda_,
		long num_movies_, long num_users_, long num_features_) :
		Y(Y_),R(R_),lambda(lambda_),
		num_movies(num_movies_), num_users(num_users_),num_features(num_features_)
		{ }
		template<typename EXP>
		double inline operator()(const EXP& arg) const {
			//cout << "----" << endl;
			typedef const dlib::matrix_op<dlib::op_munfold<EXP> > unfolded;
			//clock_t start = clock();
			//cout << clock() << endl;
			const unfolded X = dlib::munfold(arg, 0, num_movies, num_features);
			const unfolded Theta = dlib::munfold(arg, num_movies * num_features, num_users, num_features);
			//cout << clock() << endl;
			tmp_error = X * trans(Theta) - Y;
			//cout << clock() << endl;
			double result = dlib::sum(dlib::squared(tmp_error))/2
					/* plus regularization term lambda/2*(sumsq(Theta(:)) + sumsq(X(:))) */
					+ lambda/2 * (
					dlib::sum(dlib::squared(X))
					+ dlib::sum(dlib::squared(Theta))
					);
//			cout <<  clock() << endl;
//			cout << "worked : " << clock() - start << endl;
//			cout << "cost : " << result << endl;
//			cout << "----" << endl;
			return result;
		}

		
		const T Y;
		const T R;
		const double lambda;
		const long num_movies;
		const long num_users;
		const long num_features;
		mutable matrix<double> tmp_error;
		

	};
	template <typename T>
	inline const T unfold (const T& val, long offset, long rows, long columns)
	{
		return dlib::reshape(dlib::crop_cols(val, offset, offset + rows*columns), rows, columns);
	}
	template<typename T>
	class GDDer {
	public:
		GDDer(GDFunc<T>& f_) : f(f_) {}

		template<typename EXP>
		const T operator()(const EXP& arg) const {
			typedef const dlib::matrix_op<dlib::op_munfold<EXP> > unfolded;
			const unfolded X = dlib::munfold(arg, 0, f.num_movies, f.num_features);
			const unfolded Theta = dlib::munfold(arg, f.num_movies * f.num_features, f.num_users, f.num_features);
			// X_grad = th*Theta + lambda*X
			// Theta_grad = th'*X + lambda*Theta
			//const T regX = f.tmp_error * Theta + X * f.lambda;
			//const T regTheta = trans(f.tmp_error) * X + Theta * f.lambda;
			return dlib::join_cols(
					dlib::reshape_to_column_vector(f.tmp_error * Theta + X * f.lambda), //regX
					dlib::reshape_to_column_vector(trans(f.tmp_error) * X + Theta * f.lambda) // regTheta
					);
		}
	private:
		GDFunc<T>& f;
	};

	using std::map;
	using std::pair;
	using std::vector;
	using std::multimap;

	multimap<double, int, std::greater<double> > find_n_max(matrix<double> column, size_t n) {
		typedef pair<double, int> pair_t;
		typedef multimap<double, int, std::greater<double> > map_t;
		map_t result;
		result.insert(pair_t(column(0,0),0));

		for (long i = 1; i < column.nr(); ++i) {
			if (result.size() == n && (--result.end())->first < column(i,0)) {
				result.erase(--result.end());
				result.insert(pair_t(column(i,0),i));
			} else if (result.size() < n) {
				result.insert(pair_t(column(i,0),i));
			}
		}
		return result;
	}

	typedef vector<multimap<double, int, std::greater<double> > > recommends;
	recommends mostRecommend(const matrix<double>& predictedY,int n) {
		recommends result;
		matrix<double> up;
		for (long i = 0; i < predictedY.nc(); ++i) {
			up = colm(predictedY,i);
			result.push_back(find_n_max(up,n));
		}
		return result;
	}


}
