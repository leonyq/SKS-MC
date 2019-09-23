/**
 * 新建者：cjdjk@139.com
 * 新建时间表: 2018-01-25 10:30
 * 修改者：cjdjk@139.com
 * 修改时间表: 2018-01-25 10:30
 * 修改内容:
 */

function $package(pkg) {
	if (typeof(pkg) != "string")
		return;
	pkg = pkg.split(".");
	var obj, pkgIndex;
	for (var i = 0, len = pkg.length;i < len, pkgIndex = pkg[i]; i++) {
		try {
			obj = (obj ? (obj[pkgIndex] = obj[pkgIndex] || {}) : (eval(pkgIndex + "=" + pkgIndex + "||{}")))
		 
		} catch (e) {
			obj = eval(pkgIndex + "={}")
		}
	}
}//function $package(pkg) {
