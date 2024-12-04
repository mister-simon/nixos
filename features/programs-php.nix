{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    php84
    php84Packages.composer
    php84Extensions.ctype
    php84Extensions.curl
    php84Extensions.dom
    php84Extensions.fileinfo
    php84Extensions.filter
    php84Extensions.mbstring
    php84Extensions.openssl
    php84Extensions.pdo
    php84Extensions.session
    php84Extensions.tokenizer
    php84Extensions.xml
  ];
}
