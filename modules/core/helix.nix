{ pkgs, lib, inputs, ... }:
{
  programs.helix = with pkgs; {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = lib.mkForce "onedark";
      editor = {
        color-modes = true;
        cursorline = true;
        bufferline = "multiple";
        soft-wrap.enable = true;
      };
    };
    extraPackages = [
      bash-language-server
      clang-tools
      docker-compose-language-service
      dockerfile-language-server-nodejs
      golangci-lint
      golangci-lint-langserver
      gopls
      gotools
      lua-language-server
      marksman
      nixd
      nixpkgs-fmt
      nodePackages.prettier
      nodePackages.typescript-language-server
      pgformatter
      (python3.withPackages (p: (with p; [
        ruff
        python-lsp-ruff
        python-lsp-server
      ])))
      rust-analyzer
      ruby_3_4
      rubyPackages_3_4.solargraph
      stylua
      terraform-ls
      typescript
      vscode-langservers-extracted
      yaml-language-server
    ];
    languages = {
      language = [
      {
          name = "json";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = ["format"];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.json"];
          };
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = ["nil" "lsp-ai"];
          formatter = {
            command = "alejandra";
          };
          auto-format = true;
        }
        {
          name = "sql";
          language-servers = ["gpt"];
          formatter = {
            command = "pg_format";
            args = ["-iu1" "--no-space-function" "-"];
          };
          auto-format = true;
        }
        {
          name = "markdown";
          soft-wrap.enable = true;
        }
        {
          name = "fsharp";
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = ["yaml-language-server"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.yaml"];
          };
          auto-format = true;
        }
      ];
      language-server.fsharp = {
        command = "${pkgs.fsautocomplete}/bin/fsautocomplete";
      };
      language-server.yaml-language-server = {
        config.yaml = {
          format.enable = true;
          schemas = { kubernetes = "k8s/*.yaml";};
        };
      };
    };
  };
}
