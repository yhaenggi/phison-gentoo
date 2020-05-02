EAPI=7

#inherit linux-mod git-2
inherit linux-mod linux-info git-r3

DESCRIPTION="phison kernel module is for PCcard (PCIe) SSD's. AKA PHISON PS5000 E-BOX"
HOMEPAGE="https://github.com/yhaenggi/phison-gentoo"
#EGIT_REPO_URI="https://github.com/yhaenggi/phison-dkms.git"
EGIT_REPO_URI="https://gitlab.traefik.k8s.darkgamex.ch/yhaenggi/phison-gentoo.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CONFIG_CHECK="!CONFIG_ATA !CONFIG_PCI !CONFIG_MODULES !CONFIG_BLK_DEV !CONFIG_SCSI"
MODULE_NAMES="phison(kernel/drivers/ata:${S})"
BUILD_TARGETS="clean modules"

#src_prepare() {
#	cd ${S}/${PN}-driver
#	# Avoid "make jobserver unavailable" warning and -Werror problems
#	sed -e 's:\tmake:\t+make:g' \
#		-i Makefile || die "sed failed"
#}

src_configure() {
	set_arch_to_kernel
}

src_compile() {
	linux-mod_src_compile

}

src_install() {
	default
	linux-mod_src_install

}
