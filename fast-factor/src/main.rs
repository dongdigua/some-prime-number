fn main() {
    let argv: Vec<String> = std::env::args().collect();

    if argv.len() == 1 {
        println!("need one arg")
    } else if argv.len() == 2 {
        let num_str = argv[1].trim();
        println!("{:?}", num_str)
    } else {
        eprintln!("too many arguments!");
        std::process::exit(1)
    }
}
