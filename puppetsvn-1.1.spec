#
# Spec file for puppetsvn
#
Name: puppetsvn
Version: 1.1
Release: 1
Summary: Puppet module for subversion
License: GPL
Group: Applications/Internet
URL: https://puppet.com/
Distribution: WSS Linux
Source: https://s3.amazonaws.com/rhnylyukh.svnpuppet/111/puppetsvn-1.1.tar.gz
Packager: Rostyslav Hnylyukh <rhnyl@softserveinc.com>
BuildArch: noarch
Requires: puppet-agent, httpd, subversion, mod_dav_svn


%description
Puppet module for install subversion

%prep
%setup -q

%build

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/etc/puppetlabs/code/environments/production/
cp -Rp * %{buildroot}/etc/puppetlabs/code/environments/production/

%post

%files
%attr(0755,root,root)
%{buildroot}/etc/puppetlabs/code/environments/production/
/*

%clean
rm -rf $RPM_BUILD_ROOT

%changelog
* Tue Oct 30 2018 Rostyslav Hnylyukh rhnyl@softserveinc.com
- initial packaging
