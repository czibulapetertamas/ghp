# GHP - PHP Version Manager with Docker

GHP is a simple tool to manage multiple PHP versions using Docker. Inspired by tools like `nvm`, `ghp` allows you to install, switch between, and list PHP versions with ease.

## Features
- Install specific PHP versions using Docker
- Switch between installed PHP versions
- List all installed PHP versions
- Easy installation script

## Installation

To install `ghp`, run the following command in your terminal:

```sh
curl -sSL https://raw.githubusercontent.com/czibulapetertamas/ghp/main/install.sh | bash
```
## Usage
### Install a PHP Version
```sh
ghp install 8.3
```
### Use a PHP Version
```sh
ghp use 8.3
```
### List Installed PHP Versions
```sh
ghp list
```

## License
This project is licensed under the MIT License.
