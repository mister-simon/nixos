{ ... }:
{
  # https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Virtual-Devices#combine-sink-all-sinks
  services.pipewire.extraConfig.pipewire."50-combined_stream" = {
    "context.modules" = [
      {
        name = "libpipewire-module-combine-stream";
        args = {
          "combine.mode" = "sink";
          "node.name" = "combine_sink";
          "node.description" = "Combined";
          "combine.latency-compensate" = false;
          "combine.props" = {
            "audio.position" = [
              "FL"
              "FR"
            ];
          };
          "stream.props" = { };
          "stream.rules" = [
            {
              matches = [ { "media.class" = "Audio/Sink"; } ];
              actions.create-stream = { };
            }
          ];
        };
      }
    ];
  };
}
