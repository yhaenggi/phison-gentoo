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
#MODULE_NAMES="phison(kernel/drivers/ata:${S})"
#MODULE_NAMES="phison(kernel/drivers/ata:)"
MODULE_NAMES="phison(kernel/drivers/ata)"
BUILD_TARGETS="modules"

pkg_setup() {
	linux-mod_pkg_setup
}

src_configure() {
	set_arch_to_kernel
}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}
