use rayon::prelude::*;
use num_bigint::BigUint;
use integer_sqrt::IntegerSquareRoot;

pub fn decompose(num_str: String) -> Vec<u128> {
    let num: u128 = num_str.parse().expect("not a valid integer");
    println!("uint: {:?}", num);
    (1..=num.integer_sqrt())
        .into_par_iter()
        .filter_map(|i| {
            if num % i == 0 { Some(i) } else { None }
        })
        .collect()
}


