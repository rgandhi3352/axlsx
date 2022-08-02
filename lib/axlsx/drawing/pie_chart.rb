# encoding: UTF-8
module Axlsx


  # The PieChart is a three dimentional piechart (who would have guessed?) that you can add to your worksheet.
  # @see Worksheet#add_chart
  # @see Chart#add_series
  # @see README for an example
  class PieChart < Chart

    # Creates a new pie chart object
    # @param [GraphicFrame] frame The workbook that owns this chart.
    # @option options [Cell, String] title
    # @option options [Boolean] show_legend
    # @option options [Symbol] grouping
    # @option options [String] gap_depth
    # @option options [Integer] rot_x
    # @option options [String] h_percent
    # @option options [Integer] rot_y
    # @option options [String] depth_percent
    # @option options [Boolean] r_ang_ax
    # @option options [Integer] perspective
    # @see Chart
    def initialize(frame, options={})
      @vary_colors = true
      super(frame, options)
      @series_type = PieSeries
      @d_lbls = nil
    end

    # Serializes the object
    # @param [String] str
    # @return [String]
    def to_xml_string(str = '')
      super(str) do
        str << '<c:pieChart>'
        str << ('<c:varyColors val="' << vary_colors.to_s << '"/>')
        @series.each { |ser| ser.to_xml_string(str) }
        d_lbls.to_xml_string(str) if @d_lbls
        str << '</c:pieChart>'
      end
    end

  end
end
