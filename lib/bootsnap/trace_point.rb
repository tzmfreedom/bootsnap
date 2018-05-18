module Bootsnap
  module TracePoint
    def load_iseq(iseq)
      iseq = super(iseq)
      do_load_iseq(iseq)
      iseq
    end

    def do_load_iseq(iseq)
      Bootsnap.set_trace_flag_to_iseq(iseq)
      iseq.each_child { |child_iseq| do_load_iseq(child_iseq) }
    end
  end
end
