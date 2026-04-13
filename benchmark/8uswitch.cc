#include <string>
#include <fstream>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/types.h>
#include <sys/stat.h>

#include <sys/stat.h>
#include <sys/socket.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <signal.h>

#include <sys/un.h>
#include <sys/syscall.h>
#include <pthread.h>

#include <event2/event.h>
#include <event2/http.h>
#include <event2/listener.h>
#include <event2/buffer.h>
#include <event2/util.h>
#include <event2/keyvalq_struct.h>

#include <netinet/in.h>
#include <arpa/inet.h>

#include "uswitchsandbox.h"
#include "uswitch.hpp"

#define DEF_FUNC_PTR(name) decltype(name) *name##_s;
#define SET_FUNC_PTR(name) args->o->name##_s = (decltype(name) *)args->sandbox->get_symbol_addr(#name)
#define FUNC_PTR(name) (decltype(name) *)o->name##_s
//DEF_FUNC_PTR(evhttp_uri_parse);
//DEF_FUNC_PTR(evhttp_uri_get_path);
//DEF_FUNC_PTR(evhttp_uri_free);
//DEF_FUNC_PTR(evhttp_request_get_uri);
//DEF_FUNC_PTR(evhttp_send_error);
//DEF_FUNC_PTR(evhttp_add_header);
//DEF_FUNC_PTR(evhttp_request_get_output_headers);
//DEF_FUNC_PTR(evbuffer_new);
//DEF_FUNC_PTR(evbuffer_add_reference);
//DEF_FUNC_PTR(evhttp_send_reply);
//DEF_FUNC_PTR(evbuffer_free);
//DEF_FUNC_PTR(event_enable_debug_logging);
//DEF_FUNC_PTR(event_config_new);
//DEF_FUNC_PTR(event_base_new_with_config);
//DEF_FUNC_PTR(event_config_free);
//DEF_FUNC_PTR(evhttp_new);
//DEF_FUNC_PTR(evhttp_set_gencb);
//DEF_FUNC_PTR(evhttp_set_max_body_size);
//DEF_FUNC_PTR(evhttp_bind_socket_with_handle);
//DEF_FUNC_PTR(event_base_dispatch);

 std::vector<struct event_base*> bases;
 std::vector<uswctx_t> ctxs;
struct options {
    int port;
    int verbose;
    int max_body_size;
    int comps;

    const char *bind;
    const char *docroot;
    char *sandbox_strings[3];
    DEF_FUNC_PTR(evhttp_uri_parse);
DEF_FUNC_PTR(evhttp_uri_get_path);
DEF_FUNC_PTR(evhttp_uri_free);
DEF_FUNC_PTR(evhttp_request_get_uri);
DEF_FUNC_PTR(evhttp_send_error);
DEF_FUNC_PTR(evhttp_add_header);
DEF_FUNC_PTR(evhttp_request_get_output_headers);
DEF_FUNC_PTR(evbuffer_new);
DEF_FUNC_PTR(evbuffer_add_reference);
DEF_FUNC_PTR(evhttp_send_reply);
DEF_FUNC_PTR(evbuffer_free);
DEF_FUNC_PTR(event_enable_debug_logging);
DEF_FUNC_PTR(event_config_new);
DEF_FUNC_PTR(event_base_new_with_config);
DEF_FUNC_PTR(event_config_free);
DEF_FUNC_PTR(evhttp_new);
DEF_FUNC_PTR(evhttp_set_gencb);
DEF_FUNC_PTR(evhttp_set_max_body_size);
DEF_FUNC_PTR(evhttp_bind_socket_with_handle);
DEF_FUNC_PTR(event_base_loop);
};

struct server_args {
        USwitchSandbox *sandbox;
        struct event_config* cfg;
        struct event_base* base;
        struct evhttp* http;
        struct evhttp_bound_socket *handle;
        struct evconnlistener* lev;
        int port;
        int verbose;
        int max_body_size;
        int comps;

        const char *bind;
        const char *docroot;
        struct options *o;
	uswctx_t ctx;
};

static const char *StringLiterals[] = {
    "Content-Type",
    "text/plain",
    "OK"
};

static void load_sandbox_strings(USwitchSandbox *sandbox, struct options *opts) {
    int i = 0;
    for (const char *s : StringLiterals) {
        size_t len = strlen(s) + 1;
        char *buf = (char *)sandbox->malloc_in_sandbox(len);
	if (!buf)
		printf("Help null pointer\n");
        strcpy(buf, s);
        opts->sandbox_strings[i] = buf;
	i++;
    }
}


static bool get_path(uswctx_t ctx, const char *uri, struct options *o, std::string &res, USwitchSandbox *sandbox) {
    struct evhttp_uri *decoded;
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_uri_parse), decoded, uri);
    std::string path;
   // path= "/";
   // res = o->docroot +path;
   // printf("path %s\n", res);
   // return true;
    if (!decoded) {
        return false;
    }
    const char *p = nullptr;
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_uri_get_path), p, decoded);
    if (p) {
        path = p;
    } else {
        path = "/";
    }
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_uri_free), decoded);
    res = o->docroot + path;
    return true;
}

static void
send_document_cb(uswctx_t ctx, void *data, struct evhttp_request *req, void *arg)
{
    USwitchSandbox *sandbox = (USwitchSandbox *)data;
//    SET_FUNC_PTR1(evhttp_uri_parse);
//    SET_FUNC_PTR1(evhttp_uri_get_path);
//    SET_FUNC_PTR1(evhttp_uri_free);
//    SET_FUNC_PTR1(evhttp_request_get_uri);
//    SET_FUNC_PTR1(evhttp_send_error);
//    SET_FUNC_PTR1(evhttp_add_header);
//    SET_FUNC_PTR1(evhttp_request_get_output_headers);
//    SET_FUNC_PTR1(evbuffer_new);
//    SET_FUNC_PTR1(evbuffer_add_reference);
//    SET_FUNC_PTR1(evhttp_send_reply);
//    SET_FUNC_PTR1(evbuffer_free);
//    SET_FUNC_PTR1(event_enable_debug_logging);
//    SET_FUNC_PTR1(event_config_new);
//    SET_FUNC_PTR1(event_base_new_with_config);
//    SET_FUNC_PTR1(event_config_free);
//    SET_FUNC_PTR1(evhttp_new);
//    SET_FUNC_PTR1(evhttp_set_gencb);
//    SET_FUNC_PTR1(evhttp_set_max_body_size);
//    SET_FUNC_PTR1(evhttp_bind_socket_with_handle);
//    SET_FUNC_PTR1(event_base_dispatch);
    struct options *o = (struct options *)sandbox->custom_data;
    const char *uri;
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_request_get_uri), uri, req);
    std::string path;
    if (!get_path(ctx, uri, o, path, sandbox)) {
        uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_send_error), req, HTTP_BADREQUEST, nullptr);
        return;
    }

    std::ifstream ifs(path, std::ios::binary);
    if (!ifs) {
        uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_send_error), req, HTTP_NOTFOUND, nullptr);
        return;
    }
    evkeyvalq *headers;
//    char* type = (char*)sandbox->malloc_in_sandbox(strlen("text/plain")*sizeof(char));
//    strcpy(content, "Content-Type");
//    strcpy(type, "text/plain");
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_request_get_output_headers), headers, req);
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_add_header), nullptr, headers,
        o->sandbox_strings[0], o->sandbox_strings[1]);
    
    ifs.seekg(0, std::ios_base::end);
    size_t size = ifs.tellg();
    ifs.seekg(0, std::ios_base::beg);
    char* content = (char*)sandbox->malloc_in_sandbox((size/8)*sizeof(char));
    uint8_t *input = (uint8_t *)sandbox->malloc_in_sandbox(size);
    if (!input || !ifs.read((char *)input, size)) {
        uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_send_error), req, HTTP_INTERNAL, nullptr);
        delete[] input;
        return;
    }
    struct evbuffer *evb;
    uswitch_call_dynamic(ctx, FUNC_PTR(evbuffer_new), evb);
    uswitch_call_dynamic(ctx, FUNC_PTR(evbuffer_add_reference), nullptr, evb, input, size,
        (evbuffer_ref_cleanup_cb)sandbox->get_symbol_addr("free"), input);
    uswitch_call_dynamic(ctx, FUNC_PTR(evhttp_send_reply), req, 200, o->sandbox_strings[2], evb);
    uswitch_call_dynamic(ctx, FUNC_PTR(evbuffer_free), evb);
   // sandbox->free_in_sandbox(input);
   sandbox->free_in_sandbox(content);
   // sandbox->free_in_sandbox(type);
}

static void
print_usage(FILE *out, const char *prog, int exit_code)
{
    fprintf(out,
        "Syntax: %s [ OPTS ] <docroot>\n"
        " -p      - port\n"
        " -H      - address to bind (default: 0.0.0.0)\n"
        " -u      - unlink unix socket before bind\n"
        " -m      - max body size\n"
        " -v      - verbosity, enables libevent debug logging too\n", prog);
    exit(exit_code);
}
static struct options
parse_opts(int argc, char **argv)
{
    struct options o;
    int opt;

    memset(&o, 0, sizeof(o));

    while ((opt = getopt(argc, argv, "hp:m:vH:c:")) != -1) {
        switch (opt) {
            case 'p': o.port = atoi(optarg); break;
            case 'm': o.max_body_size = atoi(optarg); break;
            case 'v': ++o.verbose; break;
            case 'H': o.bind = optarg; break;
            case 'h': print_usage(stdout, argv[0], 0); break;
	    case 'c': o.comps = atoi(optarg); break;
            default : fprintf(stderr, "Unknown option %c\n", opt); break;
        }
    }

    if (optind >= argc || (argc - optind) > 1) {
        print_usage(stdout, argv[0], 1);
    }
    o.docroot = argv[optind];

    return o;
}



void* run_server(void* arg) {
    struct server_args *args = (struct server_args*)arg;

load_sandbox_strings(args->sandbox, args->o);
    uswctx_t ctx = args->sandbox->get_context();
    args->ctx = ctx;
    SET_FUNC_PTR(evhttp_uri_parse);
    SET_FUNC_PTR(evhttp_uri_get_path);
    SET_FUNC_PTR(evhttp_uri_free);
    SET_FUNC_PTR(evhttp_request_get_uri);
    SET_FUNC_PTR(evhttp_send_error);
    SET_FUNC_PTR(evhttp_add_header);
    SET_FUNC_PTR(evhttp_request_get_output_headers);
    SET_FUNC_PTR(evbuffer_new);
    SET_FUNC_PTR(evbuffer_add_reference);
    SET_FUNC_PTR(evhttp_send_reply);
    SET_FUNC_PTR(evbuffer_free);
    SET_FUNC_PTR(event_enable_debug_logging);
    SET_FUNC_PTR(event_config_new);
    SET_FUNC_PTR(event_base_new_with_config);
    SET_FUNC_PTR(event_config_free);
    SET_FUNC_PTR(evhttp_new);
    SET_FUNC_PTR(evhttp_set_gencb);
    SET_FUNC_PTR(evhttp_set_max_body_size);
    SET_FUNC_PTR(evhttp_bind_socket_with_handle);
    SET_FUNC_PTR(event_base_loop);
    if (signal(SIGPIPE, SIG_IGN) == SIG_ERR) {
        return NULL;
    }

    setbuf(stdout, NULL);
    setbuf(stderr, NULL);

    /** Read env like in regress */
    if (args->verbose || getenv("EVENT_DEBUG_LOGGING_ALL"))
        uswitch_call_dynamic(ctx, args->o->event_enable_debug_logging_s, EVENT_DBG_ALL);

    uswitch_call_dynamic(ctx, args->o->event_config_new_s, args->cfg);

    uswitch_call_dynamic(ctx, args->o->event_base_new_with_config_s, args->base, args->cfg);
    if (!args->base) {
        fprintf(stderr, "Couldn't create an event_base: exiting\n");
        return NULL;
    }
    uswitch_call_dynamic(ctx, args->o->event_config_free_s, args->cfg);
    args->cfg = NULL;

    uswitch_call_dynamic(ctx, args->o->evhttp_new_s, args->http, args->base);
    if (!args->http) {
        fprintf(stderr, "couldn't create evhttp. Exiting.\n");
        return NULL;
    }
    args->sandbox->custom_data = (void *)args->o;

    auto send_document_cb_s = uswitch_register_callback_get_fp(16, ctx, (void *)args->sandbox, send_document_cb);
    uswitch_call_dynamic(ctx, args->o->evhttp_set_gencb_s, args->http, send_document_cb_s, nullptr);
    if (args->max_body_size) {
        uswitch_call_dynamic(ctx, args->o->evhttp_set_max_body_size_s, args->http, args->max_body_size);
    }

    char *bind_s = nullptr;
    if (args->bind) {
        size_t len = strlen(args->bind) + 1;
        bind_s = (char *)args->sandbox->malloc_in_sandbox(len);
        memcpy(bind_s, args->bind, len);
    }
    uswitch_call_dynamic(ctx, args->o->evhttp_bind_socket_with_handle_s, args->handle, args->http, bind_s, args->port);
    if (!args->handle) {
        fprintf(stderr, "couldn't bind to %s:%d. Exiting.\n", args->bind, args->port);
        return NULL;
    }


    ctxs.push_back(ctx);
    uswitch_call_dynamic(ctx, args->o->event_base_loop_s, nullptr, args->base, EVLOOP_NONBLOCK);
return NULL;
}

int
main(int argc, char **argv)
{
    struct event_config *cfg = NULL;
    struct event_base *base = NULL;
    struct evhttp *http = NULL;
    struct evhttp_bound_socket *handle = NULL;
    struct evconnlistener *lev = NULL;
    struct options o = parse_opts(argc, argv);
    std::vector<USwitchSandbox*> sandboxes;
    std::vector<struct server_args*> args;
    pthread_t threads[o.comps];

    for (int i = 0; i < o.comps; i++) {
	struct server_args *this_arg = (struct server_args*)malloc (sizeof(struct server_args));
	struct options *os = (struct options*)malloc(sizeof(struct options));
	memcpy(os, &o, sizeof(struct options));
	args.push_back(this_arg );
    	sandboxes.push_back(new USwitchSandbox("../libraries_uswitch/libevent/libevent.so", 8192l << 15, 2l << 15));
    	sandboxes[i]->init();
	args[i]->sandbox = sandboxes[i];
	args[i]->port = os->port+i;
	args[i]->verbose = os->verbose;
	args[i]->max_body_size = os->max_body_size;
	args[i]->bind = os->bind;
	//char *dr = (char*)malloc(strlen(os->docroot));
	//strcpy(dr, os->docroot);
	args[i]->docroot = os->docroot;
	//os->docroot = dr;
	args[i]->o = os;
	//pthread_create(&threads[i], NULL, run_server, args[i]);
	run_server(args[i]);
    }
    static const std::vector<unsigned int> AllowedSyscalls {
        __NR_readv, __NR_writev, __NR_close,
        __NR_epoll_pwait, __NR_ioctl,
        __NR_clock_gettime,
        __NR_socket, __NR_connect, __NR_shutdown,
        __NR_bind, __NR_listen, __NR_getsockname,
        __NR_setsockopt,
        __NR_exit, __NR_futex, __NR_sched_yield,
        __NR_epoll_create1, __NR_epoll_ctl,
        __NR_accept4, __NR_pipe2,
#ifdef ONLYMEMPROT
        __NR_rt_sigaction, __NR_openat, __NR_lseek, __NR_read, __NR_newfstatat,
#endif
        451};
//    sandbox.init_seccomp(AllowedSyscalls);
    while(1) {
	for (int i = 0; i < o.comps; i++) {
		uswitch_call_dynamic(args[i]->ctx, args[i]->o->event_base_loop_s, nullptr, args[i]->base, EVLOOP_NONBLOCK);
	}

    }
    sleep(2000);
    return 0;
}
