pkg_origin=chetan
pkg_name=spring-boot-sample-war
pkg_version=1.4.0
pkg_maintainer="Chetan Sarva <chetan@pixelcop.net>"
pkg_license=("Apache-2.0")
pkg_upstream_url=https://github.com/chetan/habitat-spring-boot-sample-war
pkg_source=localsource.tar.gz
pkg_deps=(chetan/tomcat8)
pkg_build_deps=(
  core/jdk8
  core/maven
)
pkg_expose=(8080)

do_download() {
  return 0;
}

do_strip() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0;
}

do_build() {
  mkdir -p $pkg_name
  cp -r $PLAN_CONTEXT/../* $pkg_name
  pushd $pkg_name
  export JAVA_HOME=$(hab pkg path core/jdk8)
  mvn package
  popd
}

do_install() {
  war_file=$(ls $pkg_name/target/*.war)
  build_line "Copying WAR file from $war_file"
  mkdir -p $pkg_prefix/dist
  cp $war_file $pkg_prefix/dist/spring-boot-sample.war
}
