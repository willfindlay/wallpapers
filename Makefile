SCRIPTSDIR=$(HOME)/.local/bin
CONFIGDIR=$(HOME)/.config
WALLPAPERDIR=$(CONFIGDIR)/wallpapers

.PHONY: install fetch

# Phony targets ----------------------------------------------------

install: fetch
	@echo "Installing wallpapers..."
	@mkdir -p $(CONFIGDIR)
	@rm -rf $(WALLPAPERDIR)
	@ln -vsnfr wallpapers $(WALLPAPERDIR)
	@echo "Installing scripts..."
	@cd scripts && for f in ./*; do \
		ln -vsnfr $$f $(SCRIPTSDIR)/$$f; \
	done
	@echo "Done!"

fetch:
	@echo "Fetching latest wallpapers from repository..."
	@git pull
