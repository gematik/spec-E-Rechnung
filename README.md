<img align="right" width="200" height="37" src="Gematik_Logo_Flag.png"/> <br/>
  
# E-Rechnung FHIR-Profiles

 ${fhir_profiles_description}
 
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
       <ul>
        <li><a href="#release-notes">Release Notes</a></li>
      </ul>     
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


## About The Project  
This Repo contains the fsh files to the published \E-Rechnung files on <https://simplifier.net/${simplifier_repo}> and a script to validate them.
 
### Release Notes
See [ReleaseNotes.md](./ReleaseNotes.md) for all information regarding the (newest) releases.
  
### Prerequisites
1. Clone this project to your local machine.
2. Run the install script once.
3. Work on teh FHIR Profiles build and validate them with the given script.
 
### Installation
To install the necessary tools run

```bash
sudo ./install_fhir_tools.sh
```

This will install

- Java SDK 17 JRE
- Sushi from <https://github.com/FHIR/sushi>
- dotnet-sdk-3.1
- firely.terminal
- yq yaml-parser

We highly recommend you use the VSCode [codfsh Extension](https://marketplace.visualstudio.com/items?itemName=gematikde.codfsh) to validate the ressources locally. 
This extension wraps SUSHI (FHIR Shorthand) and the HAPI Validator, providing comprehensive warning and error messages. It allows you to "run" your .fsh shorthand files to both generate FHIR .json files and validate them simultaneously.
 
## Contributing
If you want to contribute, please check our [CONTRIBUTING.md](./CONTRIBUTING.md).
 
## License
 
Copyright [yyyy] gematik GmbH
 
Licensed under the **Apache License, Version 2.0** (the "License"); you may not use this file except in compliance with the License.
 
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.
 
## Contact
<!-- add your own text here -->