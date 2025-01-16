/**
 * Copyright (c) 2022 Ian P Bradley <ian.bradley@studiocrabapple.com>
 * 
 */

/**
 * @file
 * ...
 */


#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavfilter/buffersink.h>
#include <libavfilter/buffersrc.h>
#include <libavutil/channel_layout.h>
#include <libavutil/opt.h>
#include <libavutil/pixdesc.h>

static AVFormatContext *ifmt_ctx;
static AVFormatContext *ofmt_ctx;
typedef struct FilteringContext {
    AVFilterContext *buffersink_ctx;
    AVFilterContext *buffersrc_ctx;
    AVFilterGraph *filter_graph;
 
    AVPacket *enc_pkt;
    AVFrame *filtered_frame;
} FilteringContext;
static FilteringContext *filter_ctx;
 
typedef struct StreamContext {
    AVCodecContext *dec_ctx;
    AVCodecContext *enc_ctx;
 
    AVFrame *dec_frame;
} StreamContext;
static StreamContext *stream_ctx;


static int open_input_file(const char *filename);
static int open_output_file(const char *filename, unsigned int max_w, unsigned int max_h);
static int init_filter(FilteringContext* fctx, AVCodecContext *dec_ctx,
        AVCodecContext *enc_ctx, const char *filter_spec);
static int init_filters(void);
static int encode_write_frame(unsigned int stream_index, int flush);
static int filter_encode_write_frame(AVFrame *frame, unsigned int stream_index);
static int flush_encoder(unsigned int stream_index);
int thumb(char* caller, char* in, char* out, char* width, char* height, char * codecid);

