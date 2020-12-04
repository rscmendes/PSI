This fork is to be used in a pratical assignment of a security and privacy course. It does not add anything to the original repo, except some additional outputs to the console for learning purposes.

# Private Set Intersection (PSI)

### Faster Private Set Intersection Based on OT Extension

By *Benny Pinkas, Thomas Schneider and Michael Zohner* in USENIX Security Symposium 2014 [1], *Benny Pinkas, Thomas Schneider, Gil Segev and Michael Zohner* in USENIX Security Symposium 2015 [2], and *Benny Pinkas, Thomas Schneider and Michael Zohner* in ePrint [3]. Please note that the code is currently being restructured and not all routines might work correctly. The PSI code is licensed under AGPLv3, see the LICENSE file for a copy of the license. The implementations for performing PSI on a sets of a billion elements can be found [here](https://github.com/Oleksandr-Tkachenko/PSI_Intersection).

### Features
---

* An implementation of different PSI protocols: 
  * the naive hashing solutions where elements are hashed and compared 
  * the server-aided protocol of [4]
  * the Diffie-Hellman-based PSI protocol of [5]
  * the OT-based PSI protocol of [3]

This code is provided as a experimental implementation for testing purposes and should not be used in a productive environment. We cannot guarantee security and correctness.

### Requirements
---

* A **Linux distribution** of your choice.
* **Required packages:**
  * [`g++`](https://packages.debian.org/testing/g++)
  * [`make`](https://packages.debian.org/testing/make)
  * [`libgmp-dev`](https://packages.debian.org/testing/libgmp-dev)
  * [`libglib2.0-dev`](https://packages.debian.org/testing/libglib2.0-dev)
  * [`libssl-dev`](https://packages.debian.org/testing/libssl-dev)

  Install these packages with your favorite package manager, e.g, `sudo apt-get install <package-name>`.

  The compilation might fail in newer operative systems (for newer versions of g++/gcc). With ubuntu 20.04 you can follow these steps.
  * `sudo apt install gcc-7 g++-7`
  * `sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7`
  * `sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7`
  * `sudo update-alternatives --config gcc  # select the option with gcc-7 if necessary`
  * `sudo update-alternatives --config g++  # select the option with g++-7 if necessary`

  After building the project (next step), you can revert back to the latest version of gcc and g++ with:
  *  `sudo update-alternatives --config gcc  # select the option with the latest gcc`
  *  `sudo update-alternatives --config g++  # select the option with the latest g++`
  
  If it says that you have no alternatives, you can add them (check the latest version of gcc and g++ installed by writting gcc in the console and pressing tab). For example for gcc-9:
  * `sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9`
  * `sudo update-alternatives --config gcc`

### Building the Project

1. Clone a copy of the main git repository and its submodules by running:
	```
	git clone --recursive https://github.com/bluetrickpt/PSI
	```

2. Enter the Framework directory: `cd PSI/`

3. Call `make` in the root directory to compile all dependencies, tests, and examples and create the executables: **psi.exe** (used for benchmarking) and **demo.exe** (a small demonstrator for intersecting email addresses).

Please note that if you downloaded this project as ZIP file instead of cloning with git, you will get compilation errors, since the Miracl library is included as external project. To solve this, download the Miracl sources in commit version `cff161b` (found [here](https://github.com/CertiVox/Miracl/tree/cff161bad6364548b361b63938a988db23f60c2a) and extract the contents of the main folder in `src/externals/Miracl`. Then, continue with steps 2 and 3.

### Executing the Code

An example demo is included and can be run by opening two terminals in the root directory. Execute in the first terminal:

	./demo.exe -r 0 -p 0 -f sample_sets/emails_alice.txt
	
and in the second terminal:
	
	./demo.exe -r 1 -p 0 -f sample_sets/emails_bob.txt
	

This should print the following output in the second terminal: 

		Computation finished. Found 3 intersecting elements:
		Michael.Zohner@ec-spride.de
		Evelyne.Wagener@tvcablenet.be
		Ivonne.Pfisterer@mail.ru



These commands will run the naive hashing protocol and compute the intersection on the 1024 randomly generated emails in sample_sets/emails_alice.txt and sample_sets/emails_bob.txt (where 3 intersecting elements were altered). To use a different protocol, the ['-p'] option can be varied as follows:
  * `-p 0`: the naive hashing protocol 
  * `-p 1`: the server-aided protocol of [4]
  * `-p 2`: the Diffie-Hellman-based PSI protocol of [5]
  * `-p 3`: the OT-based PSI protocol of [3]

For further information about the program options, run ```./demo.exe -h```.

### Testing the Protocols

The protocols will automatically be tested on randomly generated data when invoking:
```
	make test
```

WARNING: Some tests can still fail since the code is currently being debugged. 

### Generating Random Email Adresses

Further random email adresses can be generated by navigating to `sample_sets/emailgenerator/` and invoking: 

```
	./emailgenerator.py "number_of_emails"
```

The generator uses the first names, family names, and email providers listed in the corresponding files in `sample_sets/emailgenerator/` as base for the generation.

### References

[1] B. Pinkas, T. Schneider, M. Zohner. Faster Private Set Intersection Based on OT Extension. USENIX Security 2014: 797-812. Full version available at http://eprint.iacr.org/2014/447. 

[2] B. Pinkas, T. Schneider, G. Segev, M. Zohner. Phasing: Private Set Intersection using Permutation-based Hashing. USENIX Security 2015. Full version available at http://eprint.iacr.org/2015/634. 

[3] B. Pinkas, T. Schneider, M. Zohner. Scalable Private Set Intersection Based on OT Extension. Available at http://eprint.iacr.org/2016/930. 

[4] S.  Kamara,  P.  Mohassel,  M.  Raykova,  and S. Sadeghian.  Scaling private set intersection to billion-element sets.  In
Financial Cryptography and Data Security (FC’14) , LNCS. Springer, 2014.

[5] C. Meadows.   A more efficient cryptographic matchmaking protocol for use in the absence of a continuously available third party.   In IEEE S&P’86, pages 134–137. IEEE, 1986.

