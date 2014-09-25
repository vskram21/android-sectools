.class public Lcom/jcraft/jsch/ChannelSftp;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelSftp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;,
        Lcom/jcraft/jsch/ChannelSftp$LsEntry;,
        Lcom/jcraft/jsch/ChannelSftp$Header;,
        Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    }
.end annotation


# static fields
.field public static final APPEND:I = 0x2

.field private static final LOCAL_MAXIMUM_PACKET_SIZE:I = 0x8000

.field private static final LOCAL_WINDOW_SIZE_MAX:I = 0x200000

.field private static final MAX_MSG_LENGTH:I = 0x40000

.field public static final OVERWRITE:I = 0x0

.field public static final RESUME:I = 0x1

.field private static final SSH_FILEXFER_ATTR_ACMODTIME:I = 0x8

.field private static final SSH_FILEXFER_ATTR_EXTENDED:I = -0x80000000

.field private static final SSH_FILEXFER_ATTR_PERMISSIONS:I = 0x4

.field private static final SSH_FILEXFER_ATTR_SIZE:I = 0x1

.field private static final SSH_FILEXFER_ATTR_UIDGID:I = 0x2

.field private static final SSH_FXF_APPEND:I = 0x4

.field private static final SSH_FXF_CREAT:I = 0x8

.field private static final SSH_FXF_EXCL:I = 0x20

.field private static final SSH_FXF_READ:I = 0x1

.field private static final SSH_FXF_TRUNC:I = 0x10

.field private static final SSH_FXF_WRITE:I = 0x2

.field private static final SSH_FXP_ATTRS:B = 0x69t

.field private static final SSH_FXP_CLOSE:B = 0x4t

.field private static final SSH_FXP_DATA:B = 0x67t

.field private static final SSH_FXP_EXTENDED:B = -0x38t

.field private static final SSH_FXP_EXTENDED_REPLY:B = -0x37t

.field private static final SSH_FXP_FSETSTAT:B = 0xat

.field private static final SSH_FXP_FSTAT:B = 0x8t

.field private static final SSH_FXP_HANDLE:B = 0x66t

.field private static final SSH_FXP_INIT:B = 0x1t

.field private static final SSH_FXP_LSTAT:B = 0x7t

.field private static final SSH_FXP_MKDIR:B = 0xet

.field private static final SSH_FXP_NAME:B = 0x68t

.field private static final SSH_FXP_OPEN:B = 0x3t

.field private static final SSH_FXP_OPENDIR:B = 0xbt

.field private static final SSH_FXP_READ:B = 0x5t

.field private static final SSH_FXP_READDIR:B = 0xct

.field private static final SSH_FXP_READLINK:B = 0x13t

.field private static final SSH_FXP_REALPATH:B = 0x10t

.field private static final SSH_FXP_REMOVE:B = 0xdt

.field private static final SSH_FXP_RENAME:B = 0x12t

.field private static final SSH_FXP_RMDIR:B = 0xft

.field private static final SSH_FXP_SETSTAT:B = 0x9t

.field private static final SSH_FXP_STAT:B = 0x11t

.field private static final SSH_FXP_STATUS:B = 0x65t

.field private static final SSH_FXP_SYMLINK:B = 0x14t

.field private static final SSH_FXP_VERSION:B = 0x2t

.field private static final SSH_FXP_WRITE:B = 0x6t

.field public static final SSH_FX_BAD_MESSAGE:I = 0x5

.field public static final SSH_FX_CONNECTION_LOST:I = 0x7

.field public static final SSH_FX_EOF:I = 0x1

.field public static final SSH_FX_FAILURE:I = 0x4

.field public static final SSH_FX_NO_CONNECTION:I = 0x6

.field public static final SSH_FX_NO_SUCH_FILE:I = 0x2

.field public static final SSH_FX_OK:I = 0x0

.field public static final SSH_FX_OP_UNSUPPORTED:I = 0x8

.field public static final SSH_FX_PERMISSION_DENIED:I = 0x3

.field private static final UTF8:Ljava/lang/String; = "UTF-8"

.field private static final file_separator:Ljava/lang/String;

.field private static final file_separatorc:C

.field private static fs_is_bs:Z


# instance fields
.field private ackid:[I

.field private buf:Lcom/jcraft/jsch/Buffer;

.field private client_version:I

.field private cwd:Ljava/lang/String;

.field private extension_hardlink:Z

.field private extension_posix_rename:Z

.field private extension_statvfs:Z

.field private extensions:Ljava/util/Hashtable;

.field private fEncoding:Ljava/lang/String;

.field private fEncoding_is_utf8:Z

.field private home:Ljava/lang/String;

.field private interactive:Z

.field private io_in:Ljava/io/InputStream;

.field private lcwd:Ljava/lang/String;

.field private obuf:Lcom/jcraft/jsch/Buffer;

.field private opacket:Lcom/jcraft/jsch/Packet;

.field private packet:Lcom/jcraft/jsch/Packet;

.field private rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

.field private seq:I

.field private server_version:I

.field private version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 173
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    sput-object v0, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    .line 174
    sget-char v0, Ljava/io/File;->separatorChar:C

    sput-char v0, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    .line 175
    sget-char v0, Ljava/io/File;->separatorChar:C

    int-to-byte v0, v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/high16 v4, 0x20

    const/4 v3, 0x3

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 213
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 134
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->interactive:Z

    .line 135
    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    .line 136
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    .line 145
    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->client_version:I

    .line 146
    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    .line 147
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->client_version:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->version:Ljava/lang/String;

    .line 149
    iput-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    .line 150
    iput-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    .line 152
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    .line 153
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    .line 155
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    .line 182
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    .line 183
    iput-boolean v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    .line 185
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;-><init>(Lcom/jcraft/jsch/ChannelSftp;I)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    .line 214
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/ChannelSftp;->setLocalWindowSizeMax(I)V

    .line 215
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/ChannelSftp;->setLocalWindowSize(I)V

    .line 216
    const v0, 0x8000

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->setLocalPacketSize(I)V

    .line 217
    return-void
.end method

.method private _get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    .locals 28
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .parameter "skip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1021
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v26

    .line 1023
    .local v26, srcb:[B
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENR([B)V

    .line 1025
    new-instance v17, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1026
    .local v17, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v17

    .line 1027
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v19, v0

    .line 1028
    .local v19, length:I
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v27, v0

    .line 1030
    .local v27, type:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1032
    const/16 v2, 0x65

    move/from16 v0, v27

    if-eq v0, v2, :cond_0

    const/16 v2, 0x66

    move/from16 v0, v27

    if-eq v0, v2, :cond_0

    .line 1033
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1158
    .end local v17           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v19           #length:I
    .end local v27           #type:I
    :catch_0
    move-exception v15

    .line 1159
    .local v15, e:Ljava/lang/Exception;
    instance-of v2, v15, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_e

    check-cast v15, Lcom/jcraft/jsch/SftpException;

    .end local v15           #e:Ljava/lang/Exception;
    throw v15

    .line 1036
    .restart local v17       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v19       #length:I
    .restart local v27       #type:I
    :cond_0
    const/16 v2, 0x65

    move/from16 v0, v27

    if-ne v0, v2, :cond_1

    .line 1037
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v18

    .line 1038
    .local v18, i:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1041
    .end local v18           #i:I
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v3

    .line 1043
    .local v3, handle:[B
    const-wide/16 v21, 0x0

    .line 1044
    .local v21, offset:J
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_2

    .line 1045
    add-long v21, v21, p5

    .line 1048
    :cond_2
    const/16 v24, 0x1

    .line 1049
    .local v24, request_max:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1050
    move-wide/from16 v4, v21

    .line 1052
    .local v4, request_offset:J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    add-int/lit8 v6, v2, -0xd

    .line 1053
    .local v6, request_len:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-nez v2, :cond_3

    const/16 v6, 0x400

    .line 1058
    :cond_3
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count()I

    move-result v2

    move/from16 v0, v24

    if-ge v2, v0, :cond_4

    .line 1059
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 1060
    int-to-long v7, v6

    add-long/2addr v4, v7

    goto :goto_0

    .line 1063
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v17

    .line 1064
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v19, v0

    .line 1065
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v27, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1067
    const/16 v25, 0x0

    .line 1069
    .local v25, rr:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, v17

    iget v7, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    invoke-virtual {v2, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->get(I)Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_end_2
    .catch Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v25

    .line 1078
    const/16 v2, 0x65

    move/from16 v0, v27

    if-ne v0, v2, :cond_8

    .line 1079
    :try_start_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1080
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v18

    .line 1081
    .restart local v18       #i:I
    const/4 v2, 0x1

    move/from16 v0, v18

    if-ne v0, v2, :cond_7

    .line 1150
    .end local v18           #i:I
    :cond_5
    :goto_1
    invoke-virtual/range {p2 .. p2}, Ljava/io/OutputStream;->flush()V

    .line 1152
    if-eqz p3, :cond_6

    invoke-interface/range {p3 .. p3}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 1154
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1156
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 1164
    return-void

    .line 1071
    :catch_1
    move-exception v15

    .line 1072
    .local v15, e:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    iget-wide v4, v15, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;->offset:J

    .line 1073
    move-object/from16 v0, v17

    iget v2, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    int-to-long v7, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1074
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    goto/16 :goto_0

    .line 1084
    .end local v15           #e:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    .restart local v18       #i:I
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1087
    .end local v18           #i:I
    :cond_8
    const/16 v2, 0x67

    move/from16 v0, v27

    if-ne v0, v2, :cond_5

    .line 1091
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1092
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v7, 0x0

    const/4 v8, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v19, v19, -0x4

    .line 1093
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 1105
    .local v20, length_of_data:I
    sub-int v23, v19, v20

    .line 1107
    .local v23, optional_data:I
    move/from16 v16, v20

    .line 1108
    .local v16, foo:I
    :cond_9
    if-lez v16, :cond_b

    .line 1109
    move/from16 v13, v16

    .line 1110
    .local v13, bar:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    if-le v13, v2, :cond_a

    .line 1111
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v13, v2

    .line 1113
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v7, v7, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v14

    .line 1114
    .local v14, data_len:I
    if-ltz v14, :cond_5

    .line 1118
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v7, v14}, Ljava/io/OutputStream;->write([BII)V

    .line 1120
    int-to-long v7, v14

    add-long v21, v21, v7

    .line 1121
    sub-int v16, v16, v14

    .line 1123
    if-eqz p3, :cond_9

    .line 1124
    int-to-long v7, v14

    move-object/from16 v0, p3

    invoke-interface {v0, v7, v8}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    move-result v2

    if-nez v2, :cond_9

    .line 1125
    move/from16 v0, v16

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1126
    if-lez v23, :cond_5

    .line 1127
    move/from16 v0, v23

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    goto/16 :goto_1

    .line 1136
    .end local v13           #bar:I
    .end local v14           #data_len:I
    :cond_b
    if-lez v23, :cond_c

    .line 1137
    move/from16 v0, v23

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1140
    :cond_c
    move/from16 v0, v20

    int-to-long v7, v0

    move-object/from16 v0, v25

    iget-wide v9, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    cmp-long v2, v7, v9

    if-gez v2, :cond_d

    .line 1141
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1142
    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move/from16 v0, v20

    int-to-long v9, v0

    add-long/2addr v9, v7

    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    move/from16 v0, v20

    int-to-long v11, v0

    sub-long/2addr v7, v11

    long-to-int v11, v7

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v7, p0

    move-object v8, v3

    invoke-direct/range {v7 .. v12}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 1143
    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move-object/from16 v0, v25

    iget-wide v9, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    add-long v4, v7, v9

    .line 1146
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v2

    move/from16 v0, v24

    if-ge v0, v2, :cond_3

    .line 1147
    add-int/lit8 v24, v24, 0x1

    goto/16 :goto_0

    .line 1160
    .end local v3           #handle:[B
    .end local v4           #request_offset:J
    .end local v6           #request_len:I
    .end local v16           #foo:I
    .end local v17           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v19           #length:I
    .end local v20           #length_of_data:I
    .end local v21           #offset:J
    .end local v23           #optional_data:I
    .end local v24           #request_max:I
    .end local v25           #rr:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    .end local v27           #type:I
    .local v15, e:Ljava/lang/Exception;
    :cond_e
    instance-of v2, v15, Ljava/lang/Throwable;

    if-eqz v2, :cond_f

    .line 1161
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8, v15}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1162
    :cond_f
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method private _lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .locals 10
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2284
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendLSTAT([B)V

    .line 2286
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2287
    .local v2, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2288
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2289
    .local v4, length:I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2291
    .local v5, type:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2293
    const/16 v6, 0x69

    if-eq v5, v6, :cond_1

    .line 2294
    const/16 v6, 0x65

    if-ne v5, v6, :cond_0

    .line 2295
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2296
    .local v3, i:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2298
    .end local v3           #i:I
    :cond_0
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2303
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #length:I
    .end local v5           #type:I
    :catch_0
    move-exception v1

    .line 2304
    .local v1, e:Ljava/lang/Exception;
    instance-of v6, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_2

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2300
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #length:I
    .restart local v5       #type:I
    :cond_1
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 2301
    .local v0, attr:Lcom/jcraft/jsch/SftpATTRS;
    return-object v0

    .line 2305
    .end local v0           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #length:I
    .end local v5           #type:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v6, v1, Ljava/lang/Throwable;

    if-eqz v6, :cond_3

    .line 2306
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2307
    :cond_3
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method private _realpath(Ljava/lang/String;)[B
    .locals 9
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;,
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x65

    .line 2312
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendREALPATH([B)V

    .line 2314
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2315
    .local v0, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v0}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v0

    .line 2316
    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2317
    .local v3, length:I
    iget v5, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2319
    .local v5, type:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2321
    if-eq v5, v7, :cond_0

    const/16 v6, 0x68

    if-eq v5, v6, :cond_0

    .line 2322
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2325
    :cond_0
    if-ne v5, v7, :cond_1

    .line 2326
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 2327
    .local v1, i:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2329
    .end local v1           #i:I
    :cond_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 2331
    .restart local v1       #i:I
    const/4 v4, 0x0

    .local v4, str:[B
    move v2, v1

    .line 2332
    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    add-int/lit8 v1, v2, -0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    if-lez v2, :cond_3

    .line 2333
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    .line 2334
    iget v6, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v7, 0x3

    if-gt v6, v7, :cond_2

    .line 2335
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 2337
    :cond_2
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move v2, v1

    .line 2338
    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 2339
    .end local v2           #i:I
    .restart local v1       #i:I
    :cond_3
    return-object v4
.end method

.method private _sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    .locals 1
    .parameter "handle"
    .parameter "header"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2451
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendCLOSE([B)V

    .line 2452
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method private _setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    .locals 9
    .parameter "path"
    .parameter "attr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2364
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5, p2}, Lcom/jcraft/jsch/ChannelSftp;->sendSETSTAT([BLcom/jcraft/jsch/SftpATTRS;)V

    .line 2366
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2367
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2368
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2369
    .local v3, length:I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2371
    .local v4, type:I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2373
    const/16 v5, 0x65

    if-eq v4, v5, :cond_0

    .line 2374
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2381
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #length:I
    .end local v4           #type:I
    :catch_0
    move-exception v0

    .line 2382
    .local v0, e:Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_2

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2376
    .restart local v1       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3       #length:I
    .restart local v4       #type:I
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2377
    .local v2, i:I
    if-eqz v2, :cond_1

    .line 2378
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 2387
    :cond_1
    return-void

    .line 2383
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_3

    .line 2384
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2385
    :cond_3
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method private _stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2202
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    return-object v0
.end method

.method private _stat([B)Lcom/jcraft/jsch/SftpATTRS;
    .locals 10
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2173
    :try_start_0
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendSTAT([B)V

    .line 2175
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2176
    .local v2, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2177
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2178
    .local v4, length:I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2180
    .local v5, type:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2182
    const/16 v6, 0x69

    if-eq v5, v6, :cond_1

    .line 2183
    const/16 v6, 0x65

    if-ne v5, v6, :cond_0

    .line 2184
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2185
    .local v3, i:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2187
    .end local v3           #i:I
    :cond_0
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2192
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #length:I
    .end local v5           #type:I
    :catch_0
    move-exception v1

    .line 2193
    .local v1, e:Ljava/lang/Exception;
    instance-of v6, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_2

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2189
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #length:I
    .restart local v5       #type:I
    :cond_1
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 2190
    .local v0, attr:Lcom/jcraft/jsch/SftpATTRS;
    return-object v0

    .line 2194
    .end local v0           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #length:I
    .end local v5           #type:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v6, v1, Ljava/lang/Throwable;

    if-eqz v6, :cond_3

    .line 2195
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2196
    :cond_3
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method private _statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2262
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->_statVFS([B)Lcom/jcraft/jsch/SftpStatVFS;

    move-result-object v0

    return-object v0
.end method

.method private _statVFS([B)Lcom/jcraft/jsch/SftpStatVFS;
    .locals 10
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2224
    iget-boolean v6, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    if-nez v6, :cond_0

    .line 2225
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/16 v7, 0x8

    const-string v8, "statvfs@openssh.com is not supported"

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2231
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendSTATVFS([B)V

    .line 2233
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2234
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2235
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2236
    .local v3, length:I
    iget v5, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2238
    .local v5, type:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2240
    const/16 v6, 0xc9

    if-eq v5, v6, :cond_2

    .line 2241
    const/16 v6, 0x65

    if-ne v5, v6, :cond_1

    .line 2242
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2243
    .local v2, i:I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2245
    .end local v2           #i:I
    :cond_1
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2252
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #length:I
    .end local v5           #type:I
    :catch_0
    move-exception v0

    .line 2253
    .local v0, e:Ljava/lang/Exception;
    instance-of v6, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_3

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2248
    .restart local v1       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3       #length:I
    .restart local v5       #type:I
    :cond_2
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpStatVFS;->getStatVFS(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpStatVFS;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 2249
    .local v4, stat:Lcom/jcraft/jsch/SftpStatVFS;
    return-object v4

    .line 2254
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #length:I
    .end local v4           #stat:Lcom/jcraft/jsch/SftpStatVFS;
    .end local v5           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_3
    instance-of v6, v0, Ljava/lang/Throwable;

    if-eqz v6, :cond_4

    .line 2255
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2256
    :cond_4
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method static synthetic access$000(Lcom/jcraft/jsch/ChannelSftp;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    return v0
.end method

.method static synthetic access$100(Lcom/jcraft/jsch/ChannelSftp;[BJ[BII)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct/range {p0 .. p6}, Lcom/jcraft/jsch/ChannelSftp;->sendWRITE([BJ[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/jcraft/jsch/ChannelSftp;[BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/jcraft/jsch/ChannelSftp;[BII)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$300(Lcom/jcraft/jsch/ChannelSftp;[ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/jcraft/jsch/ChannelSftp;[BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/jcraft/jsch/ChannelSftp;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    return-void
.end method

.method static synthetic access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    return-object v0
.end method

.method static synthetic access$800(Lcom/jcraft/jsch/ChannelSftp;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    return v0
.end method

.method static synthetic access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    return-object v0
.end method

.method private checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    .locals 6
    .parameter "ackid"
    .parameter "header"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2433
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, p2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object p2

    .line 2434
    iget v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2435
    .local v1, length:I
    iget v2, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2436
    .local v2, type:I
    if-eqz p1, :cond_0

    .line 2437
    const/4 v3, 0x0

    iget v4, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    aput v4, p1, v3

    .line 2439
    :cond_0
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2441
    const/16 v3, 0x65

    if-eq v2, v3, :cond_1

    .line 2442
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    const-string v5, ""

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 2444
    :cond_1
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    .line 2445
    .local v0, i:I
    if-eqz v0, :cond_2

    .line 2446
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, v0}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2448
    :cond_2
    const/4 v3, 0x1

    return v3
.end method

.method private fill([BII)I
    .locals 4
    .parameter "buf"
    .parameter "s"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2866
    const/4 v1, 0x0

    .line 2867
    .local v1, i:I
    move v0, p2

    .line 2868
    .local v0, foo:I
    :goto_0
    if-lez p3, :cond_1

    .line 2869
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 2870
    if-gtz v1, :cond_0

    .line 2871
    new-instance v2, Ljava/io/IOException;

    const-string v3, "inputstream is closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2874
    :cond_0
    add-int/2addr p2, v1

    .line 2875
    sub-int/2addr p3, v1

    goto :goto_0

    .line 2877
    :cond_1
    sub-int v2, p2, v0

    return v2
.end method

.method private fill(Lcom/jcraft/jsch/Buffer;I)V
    .locals 2
    .parameter "buf"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2860
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 2861
    iget-object v0, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    .line 2862
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 2863
    return-void
.end method

.method private getCwd()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2411
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 2412
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getHome()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    .line 2413
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    return-object v0
.end method

.method private glob_local(Ljava/lang/String;)Ljava/util/Vector;
    .locals 12
    .parameter "_path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v11, 0x5c

    const/4 v10, 0x0

    .line 2770
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 2771
    .local v7, v:Ljava/util/Vector;
    const-string v8, "UTF-8"

    invoke-static {p1, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 2772
    .local v4, path:[B
    array-length v8, v4

    add-int/lit8 v2, v8, -0x1

    .line 2773
    .local v2, i:I
    :goto_0
    if-ltz v2, :cond_1

    .line 2774
    aget-byte v8, v4, v2

    const/16 v9, 0x2a

    if-eq v8, v9, :cond_0

    aget-byte v8, v4, v2

    const/16 v9, 0x3f

    if-eq v8, v9, :cond_0

    .line 2775
    add-int/lit8 v2, v2, -0x1

    .line 2776
    goto :goto_0

    .line 2778
    :cond_0
    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-nez v8, :cond_1

    if-lez v2, :cond_1

    add-int/lit8 v8, v2, -0x1

    aget-byte v8, v4, v8

    if-ne v8, v11, :cond_1

    .line 2780
    add-int/lit8 v2, v2, -0x1

    .line 2781
    if-lez v2, :cond_1

    add-int/lit8 v8, v2, -0x1

    aget-byte v8, v4, v8

    if-ne v8, v11, :cond_1

    .line 2782
    add-int/lit8 v2, v2, -0x1

    .line 2783
    add-int/lit8 v2, v2, -0x1

    .line 2784
    goto :goto_0

    .line 2790
    :cond_1
    if-gez v2, :cond_5

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_3

    .end local p1
    :goto_1
    invoke-virtual {v7, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2825
    :cond_2
    :goto_2
    return-object v7

    .line 2790
    .restart local p1
    :cond_3
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 2797
    :cond_4
    add-int/lit8 v2, v2, -0x1

    .line 2792
    :cond_5
    if-ltz v2, :cond_6

    .line 2793
    aget-byte v8, v4, v2

    sget-char v9, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    if-eq v8, v9, :cond_6

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_4

    aget-byte v8, v4, v2

    const/16 v9, 0x2f

    if-ne v8, v9, :cond_4

    .line 2800
    :cond_6
    if-gez v2, :cond_8

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_7

    .end local p1
    :goto_3
    invoke-virtual {v7, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_2

    .restart local p1
    :cond_7
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    .line 2803
    :cond_8
    if-nez v2, :cond_a

    const/4 v8, 0x1

    new-array v1, v8, [B

    sget-char v8, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    int-to-byte v8, v8

    aput-byte v8, v1, v10

    .line 2809
    .local v1, dir:[B
    :goto_4
    array-length v8, v4

    sub-int/2addr v8, v2

    add-int/lit8 v8, v8, -0x1

    new-array v5, v8, [B

    .line 2810
    .local v5, pattern:[B
    add-int/lit8 v8, v2, 0x1

    array-length v9, v5

    invoke-static {v4, v8, v5, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2814
    :try_start_0
    new-instance v8, Ljava/io/File;

    const-string v9, "UTF-8"

    invoke-static {v1, v9}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 2815
    .local v0, children:[Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2816
    .local v6, pdir:Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, j:I
    :goto_5
    array-length v8, v0

    if-ge v3, v8, :cond_2

    .line 2818
    aget-object v8, v0, v3

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    invoke-static {v5, v8}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 2819
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2816
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 2805
    .end local v0           #children:[Ljava/lang/String;
    .end local v1           #dir:[B
    .end local v3           #j:I
    .end local v5           #pattern:[B
    .end local v6           #pdir:Ljava/lang/String;
    :cond_a
    new-array v1, v2, [B

    .line 2806
    .restart local v1       #dir:[B
    invoke-static {v4, v10, v1, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4

    .line 2823
    .restart local v5       #pattern:[B
    :catch_0
    move-exception v8

    goto/16 :goto_2
.end method

.method private glob_remote(Ljava/lang/String;)Ljava/util/Vector;
    .locals 27
    .parameter "_path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2639
    new-instance v23, Ljava/util/Vector;

    invoke-direct/range {v23 .. v23}, Ljava/util/Vector;-><init>()V

    .line 2640
    .local v23, v:Ljava/util/Vector;
    const/16 v16, 0x0

    .line 2642
    .local v16, i:I
    const/16 v24, 0x2f

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v12

    .line 2643
    .local v12, foo:I
    if-gez v12, :cond_1

    .line 2644
    invoke-static/range {p1 .. p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2752
    .end local v23           #v:Ljava/util/Vector;
    :cond_0
    :goto_0
    return-object v23

    .line 2648
    .restart local v23       #v:Ljava/util/Vector;
    :cond_1
    const/16 v25, 0x0

    if-nez v12, :cond_3

    const/16 v24, 0x1

    :goto_1
    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 2649
    .local v9, dir:Ljava/lang/String;
    add-int/lit8 v24, v12, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 2651
    .local v5, _pattern:Ljava/lang/String;
    invoke-static {v9}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2653
    const/16 v19, 0x0

    .line 2654
    .local v19, pattern:[B
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v6, v0, [[B

    .line 2655
    .local v6, _pattern_utf8:[[B
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v20

    .line 2657
    .local v20, pattern_has_wildcard:Z
    if-nez v20, :cond_4

    .line 2658
    const-string v24, "/"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_2

    .line 2659
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2660
    :cond_2
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .end local v5           #_pattern:Ljava/lang/String;
    .end local v6           #_pattern_utf8:[[B
    .end local v9           #dir:Ljava/lang/String;
    .end local v19           #pattern:[B
    .end local v20           #pattern_has_wildcard:Z
    :cond_3
    move/from16 v24, v12

    .line 2648
    goto :goto_1

    .line 2664
    .restart local v5       #_pattern:Ljava/lang/String;
    .restart local v6       #_pattern_utf8:[[B
    .restart local v9       #dir:Ljava/lang/String;
    .restart local v19       #pattern:[B
    .restart local v20       #pattern_has_wildcard:Z
    :cond_4
    const/16 v24, 0x0

    aget-object v19, v6, v24

    .line 2666
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENDIR([B)V

    .line 2668
    new-instance v15, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2669
    .local v15, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v15}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v15

    .line 2670
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v18, v0

    .line 2671
    .local v18, length:I
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v22, v0

    .line 2673
    .local v22, type:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2675
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_5

    const/16 v24, 0x66

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_5

    .line 2676
    new-instance v24, Lcom/jcraft/jsch/SftpException;

    const/16 v25, 0x4

    const-string v26, ""

    invoke-direct/range {v24 .. v26}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v24

    .line 2678
    :cond_5
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-ne v0, v1, :cond_6

    .line 2679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v16

    .line 2680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2683
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 2684
    .local v14, handle:[B
    const/16 v21, 0x0

    .line 2687
    .local v21, pdir:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/jcraft/jsch/ChannelSftp;->sendREADDIR([B)V

    .line 2688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v15}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v15

    .line 2689
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v18, v0

    .line 2690
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v22, v0

    .line 2692
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_8

    const/16 v24, 0x68

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_8

    .line 2693
    new-instance v24, Lcom/jcraft/jsch/SftpException;

    const/16 v25, 0x4

    const-string v26, ""

    invoke-direct/range {v24 .. v26}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v24

    .line 2695
    :cond_8
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-ne v0, v1, :cond_9

    .line 2696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2750
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v24

    if-nez v24, :cond_0

    .line 2752
    const/16 v23, 0x0

    goto/16 :goto_0

    .line 2700
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 2701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v18, v18, -0x4

    .line 2702
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v8

    .line 2707
    .local v8, count:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 2708
    :goto_2
    if-lez v8, :cond_7

    .line 2709
    if-lez v18, :cond_a

    .line 2710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->shift()V

    .line 2711
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    add-int v25, v25, v18

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_10

    move/from16 v17, v18

    .line 2712
    .local v17, j:I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v26, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v17

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v16

    .line 2713
    if-lez v16, :cond_7

    .line 2714
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    add-int v25, v25, v16

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/jcraft/jsch/Buffer;->index:I

    .line 2715
    sub-int v18, v18, v16

    .line 2718
    .end local v17           #j:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v11

    .line 2720
    .local v11, filename:[B
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    move/from16 v24, v0

    const/16 v25, 0x3

    move/from16 v0, v24

    move/from16 v1, v25

    if-gt v0, v1, :cond_b

    .line 2721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 2723
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v7

    .line 2725
    .local v7, attrs:Lcom/jcraft/jsch/SftpATTRS;
    move-object v4, v11

    .line 2726
    .local v4, _filename:[B
    const/4 v10, 0x0

    .line 2727
    .local v10, f:Ljava/lang/String;
    const/4 v13, 0x0

    .line 2729
    .local v13, found:Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v24, v0

    if-nez v24, :cond_c

    .line 2730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2731
    const-string v24, "UTF-8"

    move-object/from16 v0, v24

    invoke-static {v10, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 2733
    :cond_c
    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v13

    .line 2735
    if-eqz v13, :cond_f

    .line 2736
    if-nez v10, :cond_d

    .line 2737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2739
    :cond_d
    if-nez v21, :cond_e

    .line 2740
    move-object/from16 v21, v9

    .line 2741
    const-string v24, "/"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_e

    .line 2742
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 2745
    :cond_e
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2747
    :cond_f
    add-int/lit8 v8, v8, -0x1

    .line 2748
    goto/16 :goto_2

    .line 2711
    .end local v4           #_filename:[B
    .end local v7           #attrs:Lcom/jcraft/jsch/SftpATTRS;
    .end local v10           #f:Ljava/lang/String;
    .end local v11           #filename:[B
    .end local v13           #found:Z
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    sub-int v17, v24, v25

    goto/16 :goto_3
.end method

.method private header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    .locals 4
    .parameter "buf"
    .parameter "header"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2894
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 2895
    iget-object v1, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v2, 0x0

    const/16 v3, 0x9

    invoke-direct {p0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v0

    .line 2896
    .local v0, i:I
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    add-int/lit8 v1, v1, -0x5

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2897
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2898
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    .line 2899
    return-object p2
.end method

.method private static isLocalAbsolutePath(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 2841
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v0

    return v0
.end method

.method private isPattern(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 2856
    const/4 v0, 0x0

    check-cast v0, [[B

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v0

    return v0
.end method

.method private isPattern(Ljava/lang/String;[[B)Z
    .locals 2
    .parameter "path"
    .parameter "utf8"

    .prologue
    .line 2849
    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 2850
    .local v0, _path:[B
    if-eqz p2, :cond_0

    .line 2851
    const/4 v1, 0x0

    aput-object v0, p2, v1

    .line 2852
    :cond_0
    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->isPattern([B)Z

    move-result v1

    return v1
.end method

.method private isPattern([B)Z
    .locals 4
    .parameter "path"

    .prologue
    .line 2756
    array-length v1, p1

    .line 2757
    .local v1, length:I
    const/4 v0, 0x0

    .line 2758
    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 2759
    aget-byte v2, p1, v0

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_0

    aget-byte v2, p1, v0

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_1

    .line 2760
    :cond_0
    const/4 v2, 0x1

    .line 2765
    :goto_1
    return v2

    .line 2761
    :cond_1
    aget-byte v2, p1, v0

    const/16 v3, 0x5c

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, v0, 0x1

    if-ge v2, v1, :cond_2

    .line 2762
    add-int/lit8 v0, v0, 0x1

    .line 2763
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2765
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private isRemoteDir(Ljava/lang/String;)Z
    .locals 6
    .parameter "path"

    .prologue
    const/4 v4, 0x0

    .line 1959
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/jcraft/jsch/ChannelSftp;->sendSTAT([B)V

    .line 1961
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1962
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 1963
    iget v2, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1964
    .local v2, length:I
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1966
    .local v3, type:I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1968
    const/16 v5, 0x69

    if-eq v3, v5, :cond_0

    .line 1975
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #length:I
    .end local v3           #type:I
    :goto_0
    return v4

    .line 1971
    .restart local v1       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v2       #length:I
    .restart local v3       #type:I
    :cond_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v5}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    .line 1972
    .local v0, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    goto :goto_0

    .line 1974
    .end local v0           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #length:I
    .end local v3           #type:I
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method private isUnique(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2923
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v0

    .line 2924
    .local v0, v:Ljava/util/Vector;
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 2925
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not unique: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2927
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    return-object v1
.end method

.method private localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 2911
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelSftp;->isLocalAbsolutePath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2913
    .end local p1
    :goto_0
    return-object p1

    .line 2912
    .restart local p1
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    sget-object v1, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 2913
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private putHEAD(BI)V
    .locals 1
    .parameter "type"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2635
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(Lcom/jcraft/jsch/Buffer;BI)V

    .line 2636
    return-void
.end method

.method private putHEAD(Lcom/jcraft/jsch/Buffer;BI)V
    .locals 1
    .parameter "buf"
    .parameter "type"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2627
    const/16 v0, 0x5e

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2628
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->recipient:I

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2629
    add-int/lit8 v0, p3, 0x4

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2630
    invoke-virtual {p1, p3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2631
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2632
    return-void
.end method

.method private read([BII)V
    .locals 4
    .parameter "buf"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2421
    const/4 v0, 0x0

    .line 2422
    .local v0, i:I
    :goto_0
    if-lez p3, :cond_1

    .line 2423
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 2424
    if-gtz v0, :cond_0

    .line 2425
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2427
    :cond_0
    add-int/2addr p2, v0

    .line 2428
    sub-int/2addr p3, v0

    goto :goto_0

    .line 2430
    :cond_1
    return-void
.end method

.method private remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2903
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 2907
    .end local p1
    :goto_0
    return-object p1

    .line 2904
    .restart local p1
    :cond_0
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v0

    .line 2906
    .local v0, cwd:Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 2907
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private sendCLOSE([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2525
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2526
    return-void
.end method

.method private sendFSTAT([B)V
    .locals 1
    .parameter "handle"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2480
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2481
    return-void
.end method

.method private sendHARDLINK([B[B)V
    .locals 2
    .parameter "p1"
    .parameter "p2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2509
    const/4 v0, 0x0

    const-string v1, "hardlink@openssh.com"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2510
    return-void
.end method

.method private sendINIT()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2456
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2457
    const/4 v0, 0x1

    const/4 v1, 0x5

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2458
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2459
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    const/16 v2, 0x9

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2460
    return-void
.end method

.method private sendLSTAT([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2477
    const/4 v0, 0x7

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2478
    return-void
.end method

.method private sendMKDIR([BLcom/jcraft/jsch/SftpATTRS;)V
    .locals 4
    .parameter "path"
    .parameter "attr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x4

    .line 2494
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2495
    const/16 v2, 0xe

    array-length v0, p1

    add-int/lit8 v3, v0, 0x9

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v0

    :goto_0
    add-int/2addr v0, v3

    invoke-direct {p0, v2, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2496
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2497
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2498
    if-eqz p2, :cond_2

    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p2, v0}, Lcom/jcraft/jsch/SftpATTRS;->dump(Lcom/jcraft/jsch/Buffer;)V

    .line 2500
    :goto_1
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v3, p1

    add-int/lit8 v3, v3, 0x9

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v1

    :cond_0
    add-int/2addr v1, v3

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v2, p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2501
    return-void

    :cond_1
    move v0, v1

    .line 2495
    goto :goto_0

    .line 2499
    :cond_2
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    goto :goto_1
.end method

.method private sendOPEN([BI)V
    .locals 3
    .parameter "path"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2537
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2538
    const/4 v0, 0x3

    array-length v1, p1

    add-int/lit8 v1, v1, 0x11

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2539
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2540
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2541
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2542
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2543
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x11

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2544
    return-void
.end method

.method private sendOPENA([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2534
    const/16 v0, 0xa

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2535
    return-void
.end method

.method private sendOPENDIR([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2515
    const/16 v0, 0xb

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2516
    return-void
.end method

.method private sendOPENR([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2528
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2529
    return-void
.end method

.method private sendOPENW([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2531
    const/16 v0, 0x1a

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2532
    return-void
.end method

.method private sendPacketPath(B[B)V
    .locals 1
    .parameter "fxp"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2546
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[BLjava/lang/String;)V

    .line 2547
    return-void
.end method

.method private sendPacketPath(B[BLjava/lang/String;)V
    .locals 4
    .parameter "fxp"
    .parameter "path"
    .parameter "extension"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2549
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2550
    array-length v1, p2

    add-int/lit8 v0, v1, 0x9

    .line 2551
    .local v0, len:I
    if-nez p3, :cond_0

    .line 2552
    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2553
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2561
    :goto_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2562
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    add-int/lit8 v3, v0, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2563
    return-void

    .line 2556
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    .line 2557
    const/16 v1, -0x38

    invoke-direct {p0, v1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2558
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2559
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {p3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    goto :goto_0
.end method

.method private sendPacketPath(B[B[B)V
    .locals 1
    .parameter "fxp"
    .parameter "p1"
    .parameter "p2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2566
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2567
    return-void
.end method

.method private sendPacketPath(B[B[BLjava/lang/String;)V
    .locals 4
    .parameter "fxp"
    .parameter "p1"
    .parameter "p2"
    .parameter "extension"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2569
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2570
    array-length v1, p2

    add-int/lit8 v1, v1, 0xd

    array-length v2, p3

    add-int v0, v1, v2

    .line 2571
    .local v0, len:I
    if-nez p4, :cond_0

    .line 2572
    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2573
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2581
    :goto_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2582
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p3}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2583
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    add-int/lit8 v3, v0, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2584
    return-void

    .line 2576
    :cond_0
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    .line 2577
    const/16 v1, -0x38

    invoke-direct {p0, v1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2578
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2579
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {p4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    goto :goto_0
.end method

.method private sendREAD([BJI)V
    .locals 6
    .parameter "handle"
    .parameter "offset"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2610
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 2611
    return-void
.end method

.method private sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    .locals 3
    .parameter "handle"
    .parameter "offset"
    .parameter "length"
    .parameter "rrq"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2614
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2615
    const/4 v0, 0x5

    array-length v1, p1

    add-int/lit8 v1, v1, 0x15

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2616
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2617
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2618
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p2, p3}, Lcom/jcraft/jsch/Buffer;->putLong(J)V

    .line 2619
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p4}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2620
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x15

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2621
    if-eqz p5, :cond_0

    .line 2622
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p5, v0, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->add(IJI)V

    .line 2624
    :cond_0
    return-void
.end method

.method private sendREADDIR([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2518
    const/16 v0, 0xc

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2519
    return-void
.end method

.method private sendREADLINK([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2512
    const/16 v0, 0x13

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2513
    return-void
.end method

.method private sendREALPATH([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2463
    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2464
    return-void
.end method

.method private sendREMOVE([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2491
    const/16 v0, 0xd

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2492
    return-void
.end method

.method private sendRENAME([B[B)V
    .locals 2
    .parameter "p1"
    .parameter "p2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2521
    const/16 v1, 0x12

    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    if-eqz v0, :cond_0

    const-string v0, "posix-rename@openssh.com"

    :goto_0
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2523
    return-void

    .line 2521
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private sendRMDIR([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2503
    const/16 v0, 0xf

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2504
    return-void
.end method

.method private sendSETSTAT([BLcom/jcraft/jsch/SftpATTRS;)V
    .locals 4
    .parameter "path"
    .parameter "attr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2483
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2484
    const/16 v0, 0x9

    array-length v1, p1

    add-int/lit8 v1, v1, 0x9

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2485
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2486
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2487
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p2, v0}, Lcom/jcraft/jsch/SftpATTRS;->dump(Lcom/jcraft/jsch/Buffer;)V

    .line 2488
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x9

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2489
    return-void
.end method

.method private sendSTAT([B)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2466
    const/16 v0, 0x11

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2467
    return-void
.end method

.method private sendSTATVFS([B)V
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2469
    const/4 v0, 0x0

    const-string v1, "statvfs@openssh.com"

    invoke-direct {p0, v0, p1, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[BLjava/lang/String;)V

    .line 2470
    return-void
.end method

.method private sendSYMLINK([B[B)V
    .locals 1
    .parameter "p1"
    .parameter "p2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2506
    const/16 v0, 0x14

    invoke-direct {p0, v0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[B)V

    .line 2507
    return-void
.end method

.method private sendWRITE([BJ[BII)I
    .locals 4
    .parameter "handle"
    .parameter "offset"
    .parameter "data"
    .parameter "start"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2588
    move v0, p6

    .line 2589
    .local v0, _length:I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2590
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, v2, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, 0xd

    add-int/lit8 v2, v2, 0x15

    array-length v3, p1

    add-int/2addr v2, v3

    add-int/2addr v2, p6

    add-int/lit8 v2, v2, 0x54

    if-ge v1, v2, :cond_0

    .line 2591
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, v2, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, 0xd

    add-int/lit8 v2, v2, 0x15

    array-length v3, p1

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x54

    sub-int v0, v1, v2

    .line 2595
    :cond_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    const/4 v2, 0x6

    array-length v3, p1

    add-int/lit8 v3, v3, 0x15

    add-int/2addr v3, v0

    invoke-direct {p0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(Lcom/jcraft/jsch/Buffer;BI)V

    .line 2596
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2597
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2598
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2, p3}, Lcom/jcraft/jsch/Buffer;->putLong(J)V

    .line 2599
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    if-eq v1, p4, :cond_1

    .line 2600
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p4, p5, v0}, Lcom/jcraft/jsch/Buffer;->putString([BII)V

    .line 2606
    :goto_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    array-length v3, p1

    add-int/lit8 v3, v3, 0x15

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2607
    return v0

    .line 2603
    :cond_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2604
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, v0}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    goto :goto_0
.end method

.method private setCwd(Ljava/lang/String;)V
    .locals 0
    .parameter "cwd"

    .prologue
    .line 2417
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    .line 2418
    return-void
.end method

.method private skip(J)V
    .locals 5
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 2880
    :goto_0
    cmp-long v2, p1, v3

    if-lez v2, :cond_0

    .line 2881
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 2882
    .local v0, bar:J
    cmp-long v2, v0, v3

    if-gtz v2, :cond_1

    .line 2886
    .end local v0           #bar:J
    :cond_0
    return-void

    .line 2884
    .restart local v0       #bar:J
    :cond_1
    sub-long/2addr p1, v0

    .line 2885
    goto :goto_0
.end method

.method private throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    .locals 3
    .parameter "buf"
    .parameter "i"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2829
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_0

    .line 2831
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v0

    .line 2833
    .local v0, str:[B
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, "UTF-8"

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2836
    .end local v0           #str:[B
    :cond_0
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, "Failure"

    invoke-direct {v1, p2, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public _put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .locals 37
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 559
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 561
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v20

    .line 562
    .local v20, dstb:[B
    const-wide/16 v27, 0x0

    .line 563
    .local v27, skip:J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-eq v0, v3, :cond_0

    const/4 v3, 0x2

    move/from16 v0, p4

    if-ne v0, v3, :cond_1

    .line 565
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v15

    .line 566
    .local v15, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v27

    .line 572
    .end local v15           #attr:Lcom/jcraft/jsch/SftpATTRS;
    :cond_1
    :goto_0
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_2

    const-wide/16 v33, 0x0

    cmp-long v3, v27, v33

    if-lez v3, :cond_2

    .line 573
    :try_start_2
    move-object/from16 v0, p1

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v29

    .line 574
    .local v29, skipped:J
    cmp-long v3, v29, v27

    if-gez v3, :cond_2

    .line 575
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "failed to resume for "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 686
    .end local v20           #dstb:[B
    .end local v27           #skip:J
    .end local v29           #skipped:J
    :catch_0
    move-exception v21

    .line 687
    .local v21, e:Ljava/lang/Exception;
    move-object/from16 v0, v21

    instance-of v3, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_19

    check-cast v21, Lcom/jcraft/jsch/SftpException;

    .end local v21           #e:Ljava/lang/Exception;
    throw v21

    .line 579
    .restart local v20       #dstb:[B
    .restart local v27       #skip:J
    :cond_2
    if-nez p4, :cond_3

    :try_start_3
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENW([B)V

    .line 582
    :goto_1
    new-instance v22, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 583
    .local v22, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v22

    .line 584
    move-object/from16 v0, v22

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v24, v0

    .line 585
    .local v24, length:I
    move-object/from16 v0, v22

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v32, v0

    .line 587
    .local v32, type:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 589
    const/16 v3, 0x65

    move/from16 v0, v32

    if-eq v0, v3, :cond_4

    const/16 v3, 0x66

    move/from16 v0, v32

    if-eq v0, v3, :cond_4

    .line 590
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "invalid type="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 580
    .end local v22           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v24           #length:I
    .end local v32           #type:I
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENA([B)V

    goto :goto_1

    .line 592
    .restart local v22       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v24       #length:I
    .restart local v32       #type:I
    :cond_4
    const/16 v3, 0x65

    move/from16 v0, v32

    if-ne v0, v3, :cond_5

    .line 593
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v23

    .line 594
    .local v23, i:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 596
    .end local v23           #i:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    .line 597
    .local v4, handle:[B
    const/4 v7, 0x0

    .line 599
    .local v7, data:[B
    const/16 v19, 0x1

    .line 601
    .local v19, dontcopy:Z
    if-nez v19, :cond_6

    .line 602
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    array-length v8, v4

    add-int/lit8 v8, v8, 0x27

    add-int/lit8 v8, v8, 0x54

    sub-int/2addr v3, v8

    new-array v7, v3, [B

    .line 608
    :cond_6
    const-wide/16 v5, 0x0

    .line 609
    .local v5, offset:J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-eq v0, v3, :cond_7

    const/4 v3, 0x2

    move/from16 v0, p4

    if-ne v0, v3, :cond_8

    .line 610
    :cond_7
    add-long v5, v5, v27

    .line 613
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v31, v0

    .line 614
    .local v31, startid:I
    const/4 v14, 0x0

    .line 615
    .local v14, ackcount:I
    const/4 v13, 0x0

    .line 616
    .local v13, _s:I
    const/4 v12, 0x0

    .line 618
    .local v12, _datalen:I
    if-nez v19, :cond_f

    .line 619
    array-length v12, v7

    .line 627
    :goto_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I

    move-result v16

    .line 630
    .local v16, bulk_requests:I
    :cond_9
    const/16 v25, 0x0

    .line 631
    .local v25, nread:I
    const/16 v17, 0x0

    .line 632
    .local v17, count:I
    move/from16 v26, v13

    .line 633
    .local v26, s:I
    move/from16 v18, v12

    .line 636
    .local v18, datalen:I
    :cond_a
    move-object/from16 v0, p1

    move/from16 v1, v26

    move/from16 v2, v18

    invoke-virtual {v0, v7, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v25

    .line 637
    if-lez v25, :cond_b

    .line 638
    add-int v26, v26, v25

    .line 639
    sub-int v18, v18, v25

    .line 640
    add-int v17, v17, v25

    .line 643
    :cond_b
    if-lez v18, :cond_c

    if-gtz v25, :cond_a

    .line 644
    :cond_c
    if-gtz v17, :cond_10

    .line 676
    :goto_3
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v10, v3, v31

    .line 677
    .local v10, _ackcount:I
    :goto_4
    if-le v10, v14, :cond_d

    .line 678
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 683
    :cond_d
    if-eqz p3, :cond_e

    invoke-interface/range {p3 .. p3}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 684
    :cond_e
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v4, v1}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 692
    return-void

    .line 622
    .end local v10           #_ackcount:I
    .end local v16           #bulk_requests:I
    .end local v17           #count:I
    .end local v18           #datalen:I
    .end local v25           #nread:I
    .end local v26           #s:I
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v7, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 623
    array-length v3, v4

    add-int/lit8 v13, v3, 0x27

    .line 624
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    sub-int/2addr v3, v13

    add-int/lit8 v12, v3, -0x54

    goto :goto_2

    .line 646
    .restart local v16       #bulk_requests:I
    .restart local v17       #count:I
    .restart local v18       #datalen:I
    .restart local v25       #nread:I
    .restart local v26       #s:I
    :cond_10
    move/from16 v9, v17

    .line 647
    .local v9, foo:I
    :goto_5
    if-lez v9, :cond_17

    .line 648
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v3, -0x1

    move/from16 v0, v31

    if-eq v3, v0, :cond_11

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v3, v3, v31

    sub-int/2addr v3, v14

    move/from16 v0, v16

    if-lt v3, v0, :cond_12

    .line 650
    :cond_11
    :goto_6
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v3, v3, v31

    sub-int/2addr v3, v14

    move/from16 v0, v16

    if-lt v3, v0, :cond_12

    .line 651
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/jcraft/jsch/ChannelSftp;->rwsize:J

    move-wide/from16 v33, v0

    int-to-long v0, v9

    move-wide/from16 v35, v0

    cmp-long v3, v33, v35

    if-ltz v3, :cond_13

    .line 669
    :cond_12
    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/jcraft/jsch/ChannelSftp;->sendWRITE([BJ[BII)I

    move-result v3

    sub-int/2addr v9, v3

    goto :goto_5

    .line 652
    :cond_13
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 653
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    const/4 v8, 0x0

    aget v11, v3, v8

    .line 654
    .local v11, _ackid:I
    move/from16 v0, v31

    if-gt v0, v11, :cond_14

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v3, -0x1

    if-le v11, v3, :cond_15

    .line 655
    :cond_14
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    if-ne v11, v3, :cond_16

    .line 656
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "ack error: startid="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, " seq="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v33, v0

    move/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, " _ackid="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 662
    :cond_15
    add-int/lit8 v14, v14, 0x1

    .line 663
    goto/16 :goto_6

    .line 659
    :cond_16
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "ack error: startid="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " seq="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " _ackid="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 671
    .end local v11           #_ackid:I
    :cond_17
    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v33, v0

    add-long v5, v5, v33

    .line 672
    if-eqz p3, :cond_9

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v33, v0

    move-object/from16 v0, p3

    move-wide/from16 v1, v33

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v3

    if-nez v3, :cond_9

    goto/16 :goto_3

    .line 681
    .end local v9           #foo:I
    .restart local v10       #_ackcount:I
    :cond_18
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_4

    .line 688
    .end local v4           #handle:[B
    .end local v5           #offset:J
    .end local v7           #data:[B
    .end local v10           #_ackcount:I
    .end local v12           #_datalen:I
    .end local v13           #_s:I
    .end local v14           #ackcount:I
    .end local v16           #bulk_requests:I
    .end local v17           #count:I
    .end local v18           #datalen:I
    .end local v19           #dontcopy:Z
    .end local v20           #dstb:[B
    .end local v22           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v24           #length:I
    .end local v25           #nread:I
    .end local v26           #s:I
    .end local v27           #skip:J
    .end local v31           #startid:I
    .end local v32           #type:I
    .restart local v21       #e:Ljava/lang/Exception;
    :cond_19
    move-object/from16 v0, v21

    instance-of v3, v0, Ljava/lang/Throwable;

    if-eqz v3, :cond_1a

    .line 689
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v21

    invoke-direct {v3, v8, v0, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 690
    :cond_1a
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 568
    .end local v21           #e:Ljava/lang/Exception;
    .restart local v20       #dstb:[B
    .restart local v27       #skip:J
    :catch_1
    move-exception v3

    goto/16 :goto_0
.end method

.method public cd(Ljava/lang/String;)V
    .locals 8
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    .line 337
    :try_start_0
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 339
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 340
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 342
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v2

    .line 343
    .local v2, str:[B
    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    .line 345
    .local v0, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getFlags()I

    move-result v3

    and-int/lit8 v3, v3, 0x4

    if-nez v3, :cond_0

    .line 346
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t change directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    .end local v0           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v2           #str:[B
    :catch_0
    move-exception v1

    .line 357
    .local v1, e:Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_2

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 349
    .restart local v0       #attr:Lcom/jcraft/jsch/SftpATTRS;
    .restart local v2       #str:[B
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v3

    if-nez v3, :cond_1

    .line 350
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t change directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 354
    :cond_1
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/jcraft/jsch/ChannelSftp;->setCwd(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 362
    return-void

    .line 358
    .end local v0           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v2           #str:[B
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_3

    .line 359
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const-string v4, ""

    invoke-direct {v3, v7, v4, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 360
    :cond_3
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const-string v4, ""

    invoke-direct {v3, v7, v4}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
.end method

.method public chgrp(ILjava/lang/String;)V
    .locals 9
    .parameter "gid"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 1980
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1982
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1984
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 1985
    .local v4, v:Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 1986
    .local v5, vsize:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1987
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 1989
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 1991
    .local v1, attr:Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 1992
    iget v6, v1, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    invoke-virtual {v1, v6, p1}, Lcom/jcraft/jsch/SftpATTRS;->setUIDGID(II)V

    .line 1993
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1986
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1996
    .end local v1           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v3           #j:I
    .end local v4           #v:Ljava/util/Vector;
    .end local v5           #vsize:I
    :catch_0
    move-exception v2

    .line 1997
    .local v2, e:Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_0

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2           #e:Ljava/lang/Exception;
    throw v2

    .line 1998
    .restart local v2       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 1999
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2000
    :cond_1
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2002
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v3       #j:I
    .restart local v4       #v:Ljava/util/Vector;
    .restart local v5       #vsize:I
    :cond_2
    return-void
.end method

.method public chmod(ILjava/lang/String;)V
    .locals 9
    .parameter "permissions"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2032
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2034
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2036
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2037
    .local v4, v:Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2038
    .local v5, vsize:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 2039
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 2041
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2043
    .local v1, attr:Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2044
    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/SftpATTRS;->setPERMISSIONS(I)V

    .line 2045
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2038
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2048
    .end local v1           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v3           #j:I
    .end local v4           #v:Ljava/util/Vector;
    .end local v5           #vsize:I
    :catch_0
    move-exception v2

    .line 2049
    .local v2, e:Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_0

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2           #e:Ljava/lang/Exception;
    throw v2

    .line 2050
    .restart local v2       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 2051
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2052
    :cond_1
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2054
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v3       #j:I
    .restart local v4       #v:Ljava/util/Vector;
    .restart local v5       #vsize:I
    :cond_2
    return-void
.end method

.method public chown(ILjava/lang/String;)V
    .locals 9
    .parameter "uid"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2006
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2008
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2010
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2011
    .local v4, v:Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2012
    .local v5, vsize:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 2013
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 2015
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2017
    .local v1, attr:Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2018
    iget v6, v1, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    invoke-virtual {v1, p1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setUIDGID(II)V

    .line 2019
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2012
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2022
    .end local v1           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v3           #j:I
    .end local v4           #v:Ljava/util/Vector;
    .end local v5           #vsize:I
    :catch_0
    move-exception v2

    .line 2023
    .local v2, e:Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_0

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2           #e:Ljava/lang/Exception;
    throw v2

    .line 2024
    .restart local v2       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 2025
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2026
    :cond_1
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2028
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v3       #j:I
    .restart local v4       #v:Ljava/util/Vector;
    .restart local v5       #vsize:I
    :cond_2
    return-void
.end method

.method public disconnect()V
    .locals 0

    .prologue
    .line 2845
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->disconnect()V

    .line 2846
    return-void
.end method

.method public exit()V
    .locals 0

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .parameter "src"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1267
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;I)Ljava/io/InputStream;
    .locals 3
    .parameter "src"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1277
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)Ljava/io/InputStream;
    .locals 2
    .parameter "src"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1270
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/InputStream;
    .locals 2
    .parameter "src"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1283
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;
    .locals 13
    .parameter "src"
    .parameter "monitor"
    .parameter "skip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1288
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1290
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1291
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1293
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v11

    .line 1295
    .local v11, srcb:[B
    invoke-direct {p0, v11}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v6

    .line 1296
    .local v6, attr:Lcom/jcraft/jsch/SftpATTRS;
    if-eqz p2, :cond_0

    .line 1297
    const/4 v1, 0x1

    const-string v3, "??"

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v4

    move-object v0, p2

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 1300
    :cond_0
    invoke-direct {p0, v11}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENR([B)V

    .line 1302
    new-instance v8, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v8, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1303
    .local v8, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v8}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v8

    .line 1304
    iget v10, v8, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1305
    .local v10, length:I
    iget v12, v8, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1307
    .local v12, type:I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v10}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1309
    const/16 v1, 0x65

    if-eq v12, v1, :cond_1

    const/16 v1, 0x66

    if-eq v12, v1, :cond_1

    .line 1310
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1511
    .end local v6           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v8           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v10           #length:I
    .end local v11           #srcb:[B
    .end local v12           #type:I
    :catch_0
    move-exception v7

    .line 1512
    .local v7, e:Ljava/lang/Exception;
    instance-of v1, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_3

    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7           #e:Ljava/lang/Exception;
    throw v7

    .line 1312
    .restart local v6       #attr:Lcom/jcraft/jsch/SftpATTRS;
    .restart local v8       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v10       #length:I
    .restart local v11       #srcb:[B
    .restart local v12       #type:I
    :cond_1
    const/16 v1, 0x65

    if-ne v12, v1, :cond_2

    .line 1313
    :try_start_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1314
    .local v9, i:I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v9}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1317
    .end local v9           #i:I
    :cond_2
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    .line 1319
    .local v5, handle:[B
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1321
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$2;

    move-object v1, p0

    move-wide/from16 v2, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp$2;-><init>(Lcom/jcraft/jsch/ChannelSftp;JLcom/jcraft/jsch/SftpProgressMonitor;[B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1509
    .local v0, in:Ljava/io/InputStream;
    return-object v0

    .line 1513
    .end local v0           #in:Ljava/io/InputStream;
    .end local v5           #handle:[B
    .end local v6           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v8           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v10           #length:I
    .end local v11           #srcb:[B
    .end local v12           #type:I
    .restart local v7       #e:Ljava/lang/Exception;
    :cond_3
    instance-of v1, v7, Ljava/lang/Throwable;

    if-eqz v1, :cond_4

    .line 1514
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1515
    :cond_4
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;)V
    .locals 7
    .parameter "src"
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 985
    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V

    .line 986
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .locals 7
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 989
    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V

    .line 990
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    .locals 8
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .parameter "skip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 995
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 997
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 998
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1000
    if-eqz p3, :cond_0

    .line 1001
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v6

    .line 1002
    .local v6, attr:Lcom/jcraft/jsch/SftpATTRS;
    const/4 v1, 0x1

    const-string v3, "??"

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v4

    move-object v0, p3

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 1003
    const/4 v0, 0x1

    if-ne p4, v0, :cond_0

    .line 1004
    invoke-interface {p3, p5, p6}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    .line 1007
    .end local v6           #attr:Lcom/jcraft/jsch/SftpATTRS;
    :cond_0
    invoke-direct/range {p0 .. p6}, Lcom/jcraft/jsch/ChannelSftp;->_get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1015
    return-void

    .line 1009
    :catch_0
    move-exception v7

    .line 1010
    .local v7, e:Ljava/lang/Exception;
    instance-of v0, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v0, :cond_1

    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7           #e:Ljava/lang/Exception;
    throw v7

    .line 1011
    .restart local v7       #e:Ljava/lang/Exception;
    :cond_1
    instance-of v0, v7, Ljava/lang/Throwable;

    if-eqz v0, :cond_2

    .line 1012
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, ""

    invoke-direct {v0, v1, v2, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 1013
    :cond_2
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "src"
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 874
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 875
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .locals 1
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 878
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 879
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .locals 29
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 884
    const/4 v13, 0x0

    .line 885
    .local v13, _dstExist:Z
    const/4 v5, 0x0

    .line 887
    .local v5, _dst:Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 889
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 890
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 892
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v27

    .line 893
    .local v27, v:Ljava/util/Vector;
    invoke-virtual/range {v27 .. v27}, Ljava/util/Vector;->size()I

    move-result v28

    .line 894
    .local v28, vsize:I
    if-nez v28, :cond_1

    .line 895
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x2

    const-string v6, "No such file"

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 971
    .end local v27           #v:Ljava/util/Vector;
    .end local v28           #vsize:I
    :catch_0
    move-exception v18

    .line 972
    .local v18, e:Ljava/lang/Exception;
    if-nez v13, :cond_0

    if-eqz v5, :cond_0

    .line 973
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 974
    .local v14, _dstFile:Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v2, v2, v6

    if-nez v2, :cond_0

    .line 975
    invoke-virtual {v14}, Ljava/io/File;->delete()Z

    .line 978
    .end local v14           #_dstFile:Ljava/io/File;
    :cond_0
    move-object/from16 v0, v18

    instance-of v2, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_f

    check-cast v18, Lcom/jcraft/jsch/SftpException;

    .end local v18           #e:Ljava/lang/Exception;
    throw v18

    .line 898
    .restart local v27       #v:Ljava/util/Vector;
    .restart local v28       #vsize:I
    :cond_1
    :try_start_1
    new-instance v16, Ljava/io/File;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 899
    .local v16, dstFile:Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->isDirectory()Z

    move-result v21

    .line 900
    .local v21, isDstDir:Z
    const/16 v17, 0x0

    .line 901
    .local v17, dstsb:Ljava/lang/StringBuffer;
    if-eqz v21, :cond_4

    .line 902
    sget-object v2, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 903
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 905
    :cond_2
    new-instance v17, Ljava/lang/StringBuffer;

    .end local v17           #dstsb:Ljava/lang/StringBuffer;
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 912
    .restart local v17       #dstsb:Ljava/lang/StringBuffer;
    :cond_3
    const/16 v22, 0x0

    .local v22, j:I
    :goto_0
    move/from16 v0, v22

    move/from16 v1, v28

    if-ge v0, v1, :cond_9

    .line 913
    move-object/from16 v0, v27

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 914
    .local v4, _src:Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v15

    .line 915
    .local v15, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 916
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not supported to get directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 907
    .end local v4           #_src:Ljava/lang/String;
    .end local v15           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v22           #j:I
    :cond_4
    const/4 v2, 0x1

    move/from16 v0, v28

    if-le v0, v2, :cond_3

    .line 908
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, "Copying multiple files, but destination is missing or a file."

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 920
    .restart local v4       #_src:Ljava/lang/String;
    .restart local v15       #attr:Lcom/jcraft/jsch/SftpATTRS;
    .restart local v22       #j:I
    :cond_5
    const/4 v5, 0x0

    .line 921
    if-eqz v21, :cond_7

    .line 922
    const/16 v2, 0x2f

    invoke-virtual {v4, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v20

    .line 923
    .local v20, i:I
    const/4 v2, -0x1

    move/from16 v0, v20

    if-ne v0, v2, :cond_6

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 925
    :goto_1
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 926
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 932
    .end local v20           #i:I
    :goto_2
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 933
    .restart local v14       #_dstFile:Ljava/io/File;
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_a

    .line 934
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v25

    .line 935
    .local v25, size_of_src:J
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v23

    .line 936
    .local v23, size_of_dst:J
    cmp-long v2, v23, v25

    if-lez v2, :cond_8

    .line 937
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed to resume for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 924
    .end local v14           #_dstFile:Ljava/io/File;
    .end local v23           #size_of_dst:J
    .end local v25           #size_of_src:J
    .restart local v20       #i:I
    :cond_6
    add-int/lit8 v2, v20, 0x1

    invoke-virtual {v4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 929
    .end local v20           #i:I
    :cond_7
    move-object/from16 v5, p2

    goto :goto_2

    .line 940
    .restart local v14       #_dstFile:Ljava/io/File;
    .restart local v23       #size_of_dst:J
    .restart local v25       #size_of_src:J
    :cond_8
    cmp-long v2, v23, v25

    if-nez v2, :cond_a

    .line 983
    .end local v4           #_src:Ljava/lang/String;
    .end local v14           #_dstFile:Ljava/io/File;
    .end local v15           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v23           #size_of_dst:J
    .end local v25           #size_of_src:J
    :cond_9
    return-void

    .line 945
    .restart local v4       #_src:Ljava/lang/String;
    .restart local v14       #_dstFile:Ljava/io/File;
    .restart local v15       #attr:Lcom/jcraft/jsch/SftpATTRS;
    :cond_a
    if-eqz p3, :cond_b

    .line 946
    const/4 v3, 0x1

    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v6

    move-object/from16 v2, p3

    invoke-interface/range {v2 .. v7}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 947
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_b

    .line 948
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v2

    move-object/from16 v0, p3

    invoke-interface {v0, v2, v3}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    .line 952
    :cond_b
    const/4 v8, 0x0

    .line 953
    .local v8, fos:Ljava/io/FileOutputStream;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v13

    .line 955
    if-nez p4, :cond_d

    .line 956
    :try_start_2
    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .end local v8           #fos:Ljava/io/FileOutputStream;
    .local v19, fos:Ljava/io/FileOutputStream;
    move-object/from16 v8, v19

    .line 962
    .end local v19           #fos:Ljava/io/FileOutputStream;
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    :goto_3
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v11

    move-object/from16 v6, p0

    move-object v7, v4

    move-object/from16 v9, p3

    move/from16 v10, p4

    invoke-direct/range {v6 .. v12}, Lcom/jcraft/jsch/ChannelSftp;->_get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 965
    if-eqz v8, :cond_c

    .line 966
    :try_start_3
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 912
    :cond_c
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_0

    .line 959
    :cond_d
    :try_start_4
    new-instance v19, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-direct {v0, v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local v8           #fos:Ljava/io/FileOutputStream;
    .restart local v19       #fos:Ljava/io/FileOutputStream;
    move-object/from16 v8, v19

    .end local v19           #fos:Ljava/io/FileOutputStream;
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    goto :goto_3

    .line 965
    :catchall_0
    move-exception v2

    if-eqz v8, :cond_e

    .line 966
    :try_start_5
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    :cond_e
    throw v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 979
    .end local v4           #_src:Ljava/lang/String;
    .end local v8           #fos:Ljava/io/FileOutputStream;
    .end local v14           #_dstFile:Ljava/io/File;
    .end local v15           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v16           #dstFile:Ljava/io/File;
    .end local v17           #dstsb:Ljava/lang/StringBuffer;
    .end local v21           #isDstDir:Z
    .end local v22           #j:I
    .end local v27           #v:Ljava/util/Vector;
    .end local v28           #vsize:I
    .restart local v18       #e:Ljava/lang/Exception;
    :cond_f
    move-object/from16 v0, v18

    instance-of v2, v0, Ljava/lang/Throwable;

    if-eqz v2, :cond_10

    .line 980
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, ""

    move-object/from16 v0, v18

    invoke-direct {v2, v3, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 981
    :cond_10
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, ""

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public getBulkRequests()I
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I

    move-result v0

    return v0
.end method

.method public getExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 2952
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 2953
    const/4 v0, 0x0

    .line 2954
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method public getHome()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    .line 2393
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 2395
    :try_start_0
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2397
    const-string v2, ""

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v0

    .line 2398
    .local v0, _home:[B
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2407
    .end local v0           #_home:[B
    :cond_0
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;

    return-object v2

    .line 2400
    :catch_0
    move-exception v1

    .line 2401
    .local v1, e:Ljava/lang/Exception;
    instance-of v2, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_1

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2402
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_1
    instance-of v2, v1, Ljava/lang/Throwable;

    if-eqz v2, :cond_2

    .line 2403
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 2404
    :cond_2
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public getServerVersion()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2931
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2932
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, "The channel is not connected."

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 2934
    :cond_0
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    return v0
.end method

.method public hardlink(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "oldpath"
    .parameter "newpath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 1822
    iget-boolean v5, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    if-nez v5, :cond_0

    .line 1823
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/16 v6, 0x8

    const-string v7, "hardlink@openssh.com is not supported"

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1828
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1830
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1831
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1833
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1835
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1836
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    invoke-direct {v5, v6, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1858
    :catch_0
    move-exception v0

    .line 1859
    .local v0, e:Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_4

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 1838
    :cond_1
    :try_start_1
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1840
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendHARDLINK([B[B)V

    .line 1843
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1844
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 1845
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1846
    .local v3, length:I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1848
    .local v4, type:I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1850
    const/16 v5, 0x65

    if-eq v4, v5, :cond_2

    .line 1851
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1854
    :cond_2
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 1855
    .local v2, i:I
    if-nez v2, :cond_3

    .line 1864
    :goto_0
    return-void

    .line 1856
    :cond_3
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1860
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_4
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_5

    .line 1861
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1862
    :cond_5
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method init()V
    .locals 0

    .prologue
    .line 220
    return-void
.end method

.method public lcd(Ljava/lang/String;)V
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 324
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 329
    :goto_0
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    .line 330
    return-void

    .line 332
    :cond_0
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x2

    const-string v2, "No such directory"

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 328
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public lpwd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2390
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    return-object v0
.end method

.method public ls(Ljava/lang/String;)Ljava/util/Vector;
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1520
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 1521
    .local v1, v:Ljava/util/Vector;
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$3;

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/ChannelSftp$3;-><init>(Lcom/jcraft/jsch/ChannelSftp;Ljava/util/Vector;)V

    .line 1527
    .local v0, selector:Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;
    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;)V

    .line 1528
    return-object v1
.end method

.method public ls(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;)V
    .locals 32
    .parameter "path"
    .parameter "selector"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1544
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v29, v0

    check-cast v29, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1546
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1547
    const/16 v24, 0x0

    .line 1548
    .local v24, pattern:[B
    new-instance v28, Ljava/util/Vector;

    invoke-direct/range {v28 .. v28}, Ljava/util/Vector;-><init>()V

    .line 1550
    .local v28, v:Ljava/util/Vector;
    const/16 v29, 0x2f

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v16

    .line 1551
    .local v16, foo:I
    const/16 v30, 0x0

    if-nez v16, :cond_0

    const/16 v29, 0x1

    :goto_0
    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 1552
    .local v11, dir:Ljava/lang/String;
    add-int/lit8 v29, v16, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 1553
    .local v5, _pattern:Ljava/lang/String;
    invoke-static {v11}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1557
    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v6, v0, [[B

    .line 1558
    .local v6, _pattern_utf8:[[B
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v25

    .line 1560
    .local v25, pattern_has_wildcard:Z
    if-eqz v25, :cond_1

    .line 1561
    const/16 v29, 0x0

    aget-object v24, v6, v29

    .line 1593
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v29

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENDIR([B)V

    .line 1595
    new-instance v18, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1596
    .local v18, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v18

    .line 1597
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v22, v0

    .line 1598
    .local v22, length:I
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v26, v0

    .line 1600
    .local v26, type:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1602
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_4

    const/16 v29, 0x66

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_4

    .line 1603
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1718
    .end local v5           #_pattern:Ljava/lang/String;
    .end local v6           #_pattern_utf8:[[B
    .end local v11           #dir:Ljava/lang/String;
    .end local v16           #foo:I
    .end local v18           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v22           #length:I
    .end local v24           #pattern:[B
    .end local v25           #pattern_has_wildcard:Z
    .end local v26           #type:I
    .end local v28           #v:Ljava/util/Vector;
    :catch_0
    move-exception v12

    .line 1719
    .local v12, e:Ljava/lang/Exception;
    instance-of v0, v12, Lcom/jcraft/jsch/SftpException;

    move/from16 v29, v0

    if-eqz v29, :cond_15

    check-cast v12, Lcom/jcraft/jsch/SftpException;

    .end local v12           #e:Ljava/lang/Exception;
    throw v12

    .restart local v16       #foo:I
    .restart local v24       #pattern:[B
    .restart local v28       #v:Ljava/util/Vector;
    :cond_0
    move/from16 v29, v16

    .line 1551
    goto/16 :goto_0

    .line 1564
    .restart local v5       #_pattern:Ljava/lang/String;
    .restart local v6       #_pattern_utf8:[[B
    .restart local v11       #dir:Ljava/lang/String;
    .restart local v25       #pattern_has_wildcard:Z
    :cond_1
    :try_start_1
    invoke-static/range {p1 .. p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1566
    .local v27, upath:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v7

    .line 1567
    .local v7, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v7}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v29

    if-eqz v29, :cond_2

    .line 1568
    const/16 v24, 0x0

    .line 1569
    move-object/from16 v11, v27

    goto/16 :goto_1

    .line 1581
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v29, v0

    if-eqz v29, :cond_3

    .line 1582
    const/16 v29, 0x0

    aget-object v24, v6, v29

    .line 1583
    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->unquote([B)[B

    move-result-object v24

    goto/16 :goto_1

    .line 1586
    :cond_3
    invoke-static {v5}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1587
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v5, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v24

    goto/16 :goto_1

    .line 1605
    .end local v7           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v27           #upath:Ljava/lang/String;
    .restart local v18       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v22       #length:I
    .restart local v26       #type:I
    :cond_4
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_5

    .line 1606
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 1607
    .local v19, i:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1610
    .end local v19           #i:I
    :cond_5
    const/4 v9, 0x0

    .line 1611
    .local v9, cancel:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v17

    .line 1613
    .local v17, handle:[B
    :cond_6
    if-nez v9, :cond_8

    .line 1615
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendREADDIR([B)V

    .line 1617
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v18

    .line 1618
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v22, v0

    .line 1619
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v26, v0

    .line 1620
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_7

    const/16 v29, 0x68

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_7

    .line 1621
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29

    .line 1623
    :cond_7
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_a

    .line 1624
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1625
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 1626
    .restart local v19       #i:I
    const/16 v29, 0x1

    move/from16 v0, v19

    move/from16 v1, v29

    if-ne v0, v1, :cond_9

    .line 1698
    .end local v19           #i:I
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 1724
    return-void

    .line 1628
    .restart local v19       #i:I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1631
    .end local v19           #i:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    const/16 v30, 0x0

    const/16 v31, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v22, v22, -0x4

    .line 1633
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v10

    .line 1638
    .local v10, count:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1639
    :goto_2
    if-lez v10, :cond_6

    .line 1640
    if-lez v22, :cond_b

    .line 1641
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->shift()V

    .line 1642
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    add-int v30, v30, v22

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_d

    move/from16 v20, v22

    .line 1645
    .local v20, j:I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v19

    .line 1646
    .restart local v19       #i:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    add-int v30, v30, v19

    move/from16 v0, v30

    move-object/from16 v1, v29

    iput v0, v1, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1647
    sub-int v22, v22, v19

    .line 1649
    .end local v19           #i:I
    .end local v20           #j:I
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 1650
    .local v14, filename:[B
    const/16 v23, 0x0

    .line 1651
    .local v23, longname:[B
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    move/from16 v29, v0

    const/16 v30, 0x3

    move/from16 v0, v29

    move/from16 v1, v30

    if-gt v0, v1, :cond_c

    .line 1652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    .line 1654
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v8

    .line 1656
    .local v8, attrs:Lcom/jcraft/jsch/SftpATTRS;
    const/16 v29, 0x1

    move/from16 v0, v29

    if-ne v9, v0, :cond_e

    .line 1657
    add-int/lit8 v10, v10, -0x1

    .line 1658
    goto/16 :goto_2

    .line 1642
    .end local v8           #attrs:Lcom/jcraft/jsch/SftpATTRS;
    .end local v14           #filename:[B
    .end local v23           #longname:[B
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    sub-int v20, v29, v30

    goto/16 :goto_3

    .line 1661
    .restart local v8       #attrs:Lcom/jcraft/jsch/SftpATTRS;
    .restart local v14       #filename:[B
    .restart local v23       #longname:[B
    :cond_e
    const/4 v15, 0x0

    .line 1662
    .local v15, find:Z
    const/4 v13, 0x0

    .line 1663
    .local v13, f:Ljava/lang/String;
    if-nez v24, :cond_11

    .line 1664
    const/4 v15, 0x1

    .line 1678
    :goto_4
    if-eqz v15, :cond_10

    .line 1679
    if-nez v13, :cond_f

    .line 1680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v14, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1682
    :cond_f
    const/16 v21, 0x0

    .line 1683
    .local v21, l:Ljava/lang/String;
    if-nez v23, :cond_14

    .line 1686
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Lcom/jcraft/jsch/SftpATTRS;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1692
    :goto_5
    new-instance v29, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v13, v2, v8}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;-><init>(Lcom/jcraft/jsch/ChannelSftp;Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;->select(Lcom/jcraft/jsch/ChannelSftp$LsEntry;)I

    move-result v9

    .line 1695
    .end local v21           #l:Ljava/lang/String;
    :cond_10
    add-int/lit8 v10, v10, -0x1

    .line 1696
    goto/16 :goto_2

    .line 1666
    :cond_11
    if-nez v25, :cond_12

    .line 1667
    move-object/from16 v0, v24

    invoke-static {v0, v14}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v15

    goto :goto_4

    .line 1670
    :cond_12
    move-object v4, v14

    .line 1671
    .local v4, _filename:[B
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v29, v0

    if-nez v29, :cond_13

    .line 1672
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v4, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1673
    const-string v29, "UTF-8"

    move-object/from16 v0, v29

    invoke-static {v13, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 1675
    :cond_13
    move-object/from16 v0, v24

    invoke-static {v0, v4}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v15

    goto :goto_4

    .line 1689
    .end local v4           #_filename:[B
    .restart local v21       #l:Ljava/lang/String;
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v21

    goto :goto_5

    .line 1720
    .end local v5           #_pattern:Ljava/lang/String;
    .end local v6           #_pattern_utf8:[[B
    .end local v8           #attrs:Lcom/jcraft/jsch/SftpATTRS;
    .end local v9           #cancel:I
    .end local v10           #count:I
    .end local v11           #dir:Ljava/lang/String;
    .end local v13           #f:Ljava/lang/String;
    .end local v14           #filename:[B
    .end local v15           #find:Z
    .end local v16           #foo:I
    .end local v17           #handle:[B
    .end local v18           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v21           #l:Ljava/lang/String;
    .end local v22           #length:I
    .end local v23           #longname:[B
    .end local v24           #pattern:[B
    .end local v25           #pattern_has_wildcard:Z
    .end local v26           #type:I
    .end local v28           #v:Ljava/util/Vector;
    .restart local v12       #e:Ljava/lang/Exception;
    :cond_15
    instance-of v0, v12, Ljava/lang/Throwable;

    move/from16 v29, v0

    if-eqz v29, :cond_16

    .line 1721
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    move-object/from16 v0, v29

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2, v12}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v29

    .line 1722
    :cond_16
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29
.end method

.method public lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .locals 4
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2267
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2269
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2270
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2272
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 2274
    :catch_0
    move-exception v0

    .line 2275
    .local v0, e:Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2276
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 2277
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2278
    :cond_1
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public mkdir(Ljava/lang/String;)V
    .locals 9
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2123
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2125
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2127
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {p0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendMKDIR([BLcom/jcraft/jsch/SftpATTRS;)V

    .line 2129
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2130
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2131
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2132
    .local v3, length:I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2134
    .local v4, type:I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2136
    const/16 v5, 0x65

    if-eq v4, v5, :cond_0

    .line 2137
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2144
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #length:I
    .end local v4           #type:I
    :catch_0
    move-exception v0

    .line 2145
    .local v0, e:Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_2

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2140
    .restart local v1       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3       #length:I
    .restart local v4       #type:I
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2141
    .local v2, i:I
    if-nez v2, :cond_1

    .line 2150
    :goto_0
    return-void

    .line 2142
    :cond_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2146
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_3

    .line 2147
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2148
    :cond_3
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method public put(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 2
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 695
    const/4 v0, 0x0

    check-cast v0, Lcom/jcraft/jsch/SftpProgressMonitor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;I)Ljava/io/OutputStream;
    .locals 1
    .parameter "dst"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 698
    const/4 v0, 0x0

    check-cast v0, Lcom/jcraft/jsch/SftpProgressMonitor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;
    .locals 6
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 701
    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)Ljava/io/OutputStream;
    .locals 18
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 717
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v14, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 719
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 720
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 722
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 723
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " is a directory"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 865
    :catch_0
    move-exception v5

    .line 866
    .local v5, e:Ljava/lang/Exception;
    instance-of v14, v5, Lcom/jcraft/jsch/SftpException;

    if-eqz v14, :cond_8

    check-cast v5, Lcom/jcraft/jsch/SftpException;

    .end local v5           #e:Ljava/lang/Exception;
    throw v5

    .line 726
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 728
    .local v4, dstb:[B
    const-wide/16 v11, 0x0

    .line 729
    .local v11, skip:J
    const/4 v14, 0x1

    move/from16 v0, p3

    if-eq v0, v14, :cond_1

    const/4 v14, 0x2

    move/from16 v0, p3

    if-ne v0, v14, :cond_2

    .line 731
    :cond_1
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    .line 732
    .local v3, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-wide v11

    .line 739
    .end local v3           #attr:Lcom/jcraft/jsch/SftpATTRS;
    :cond_2
    :goto_0
    if-nez p3, :cond_3

    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENW([B)V

    .line 742
    :goto_1
    new-instance v7, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 743
    .local v7, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v7}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v7

    .line 744
    iget v9, v7, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 745
    .local v9, length:I
    iget v13, v7, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 747
    .local v13, type:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v9}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 749
    const/16 v14, 0x65

    if-eq v13, v14, :cond_4

    const/16 v14, 0x66

    if-eq v13, v14, :cond_4

    .line 750
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14

    .line 740
    .end local v7           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v9           #length:I
    .end local v13           #type:I
    :cond_3
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENA([B)V

    goto :goto_1

    .line 752
    .restart local v7       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v9       #length:I
    .restart local v13       #type:I
    :cond_4
    const/16 v14, 0x65

    if-ne v13, v14, :cond_5

    .line 753
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v8

    .line 754
    .local v8, i:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v8}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 756
    .end local v8           #i:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v6

    .line 758
    .local v6, handle:[B
    const/4 v14, 0x1

    move/from16 v0, p3

    if-eq v0, v14, :cond_6

    const/4 v14, 0x2

    move/from16 v0, p3

    if-ne v0, v14, :cond_7

    .line 759
    :cond_6
    add-long p4, p4, v11

    .line 762
    :cond_7
    const/4 v14, 0x1

    new-array v2, v14, [J

    .line 763
    .local v2, _offset:[J
    const/4 v14, 0x0

    aput-wide p4, v2, v14

    .line 764
    new-instance v10, Lcom/jcraft/jsch/ChannelSftp$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v10, v0, v6, v2, v1}, Lcom/jcraft/jsch/ChannelSftp$1;-><init>(Lcom/jcraft/jsch/ChannelSftp;[B[JLcom/jcraft/jsch/SftpProgressMonitor;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 863
    .local v10, out:Ljava/io/OutputStream;
    return-object v10

    .line 867
    .end local v2           #_offset:[J
    .end local v4           #dstb:[B
    .end local v6           #handle:[B
    .end local v7           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v9           #length:I
    .end local v10           #out:Ljava/io/OutputStream;
    .end local v11           #skip:J
    .end local v13           #type:I
    .restart local v5       #e:Ljava/lang/Exception;
    :cond_8
    instance-of v14, v5, Ljava/lang/Throwable;

    if-eqz v14, :cond_9

    .line 868
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 869
    :cond_9
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14

    .line 734
    .end local v5           #e:Ljava/lang/Exception;
    .restart local v4       #dstb:[B
    .restart local v11       #skip:J
    :catch_1
    move-exception v14

    goto/16 :goto_0
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 2
    .parameter "src"
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 492
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 493
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;I)V
    .locals 1
    .parameter "src"
    .parameter "dst"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 495
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 496
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .locals 1
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 499
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 500
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .locals 11
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    .line 515
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 517
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 519
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v8

    .line 520
    .local v8, v:Ljava/util/Vector;
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    .line 521
    .local v9, vsize:I
    const/4 v1, 0x1

    if-eq v9, v1, :cond_2

    .line 522
    if-nez v9, :cond_1

    .line 523
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 524
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    invoke-direct {v1, v2, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 542
    .end local v8           #v:Ljava/util/Vector;
    .end local v9           #vsize:I
    :catch_0
    move-exception v7

    .line 543
    .local v7, e:Ljava/lang/Exception;
    instance-of v1, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_5

    move-object v1, v7

    .line 544
    check-cast v1, Lcom/jcraft/jsch/SftpException;

    iget v1, v1, Lcom/jcraft/jsch/SftpException;->id:I

    if-ne v1, v10, :cond_4

    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 546
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 526
    .end local v7           #e:Ljava/lang/Exception;
    .restart local v8       #v:Ljava/util/Vector;
    .restart local v9       #vsize:I
    :cond_0
    :try_start_1
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 528
    :cond_1
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    invoke-virtual {v8}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 531
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 534
    if-eqz p3, :cond_3

    .line 535
    const/4 v2, 0x0

    const-string v3, "-"

    const-wide/16 v5, -0x1

    move-object v1, p3

    move-object v4, p2

    invoke-interface/range {v1 .. v6}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 540
    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSftp;->_put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 554
    return-void

    .line 548
    .end local v8           #v:Ljava/util/Vector;
    .end local v9           #vsize:I
    .restart local v7       #e:Ljava/lang/Exception;
    :cond_4
    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7           #e:Ljava/lang/Exception;
    throw v7

    .line 550
    .restart local v7       #e:Ljava/lang/Exception;
    :cond_5
    instance-of v1, v7, Ljava/lang/Throwable;

    if-eqz v1, :cond_6

    .line 551
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 552
    :cond_6
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "src"
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 365
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 366
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .parameter "src"
    .parameter "dst"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 368
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 369
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .locals 1
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 372
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 373
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .locals 24
    .parameter "src"
    .parameter "dst"
    .parameter "monitor"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 389
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 391
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 392
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 394
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v22

    .line 395
    .local v22, v:Ljava/util/Vector;
    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v23

    .line 396
    .local v23, vsize:I
    const/4 v3, 0x1

    move/from16 v0, v23

    if-eq v0, v3, :cond_2

    .line 397
    if-nez v23, :cond_1

    .line 398
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 399
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    move-object/from16 v0, p2

    invoke-direct {v3, v4, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 484
    .end local v22           #v:Ljava/util/Vector;
    .end local v23           #vsize:I
    :catch_0
    move-exception v11

    .line 485
    .local v11, e:Ljava/lang/Exception;
    instance-of v3, v11, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_f

    check-cast v11, Lcom/jcraft/jsch/SftpException;

    .end local v11           #e:Ljava/lang/Exception;
    throw v11

    .line 401
    .restart local v22       #v:Ljava/util/Vector;
    .restart local v23       #vsize:I
    :cond_0
    :try_start_1
    invoke-static/range {p2 .. p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 403
    :cond_1
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 406
    :cond_2
    const/4 v3, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object/from16 p2, v0

    .line 409
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v16

    .line 411
    .local v16, isRemoteDir:Z
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_local(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v22

    .line 412
    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v23

    .line 414
    const/4 v10, 0x0

    .line 415
    .local v10, dstsb:Ljava/lang/StringBuffer;
    if-eqz v16, :cond_6

    .line 416
    const-string v3, "/"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 417
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 419
    :cond_3
    new-instance v10, Ljava/lang/StringBuffer;

    .end local v10           #dstsb:Ljava/lang/StringBuffer;
    move-object/from16 v0, p2

    invoke-direct {v10, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 426
    .restart local v10       #dstsb:Ljava/lang/StringBuffer;
    :cond_4
    const/16 v17, 0x0

    .local v17, j:I
    :goto_0
    move/from16 v0, v17

    move/from16 v1, v23

    if-ge v0, v1, :cond_a

    .line 427
    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 428
    .local v5, _src:Ljava/lang/String;
    const/4 v6, 0x0

    .line 429
    .local v6, _dst:Ljava/lang/String;
    if-eqz v16, :cond_8

    .line 430
    sget-char v3, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    invoke-virtual {v5, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    .line 431
    .local v14, i:I
    sget-boolean v3, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v3, :cond_5

    .line 432
    const/16 v3, 0x2f

    invoke-virtual {v5, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v15

    .line 433
    .local v15, ii:I
    const/4 v3, -0x1

    if-eq v15, v3, :cond_5

    if-le v15, v14, :cond_5

    .line 434
    move v14, v15

    .line 436
    .end local v15           #ii:I
    :cond_5
    const/4 v3, -0x1

    if-ne v14, v3, :cond_7

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    :goto_1
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 439
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v10, v3, v4}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 446
    .end local v14           #i:I
    :goto_2
    const-wide/16 v18, 0x0

    .line 447
    .local v18, size_of_dst:J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_b

    .line 449
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v9

    .line 450
    .local v9, attr:Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v9}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-wide v18

    .line 455
    .end local v9           #attr:Lcom/jcraft/jsch/SftpATTRS;
    :goto_3
    :try_start_3
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v20

    .line 456
    .local v20, size_of_src:J
    cmp-long v3, v20, v18

    if-gez v3, :cond_9

    .line 457
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "failed to resume for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 421
    .end local v5           #_src:Ljava/lang/String;
    .end local v6           #_dst:Ljava/lang/String;
    .end local v17           #j:I
    .end local v18           #size_of_dst:J
    .end local v20           #size_of_src:J
    :cond_6
    const/4 v3, 0x1

    move/from16 v0, v23

    if-le v0, v3, :cond_4

    .line 422
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    const-string v7, "Copying multiple files, but the destination is missing or a file."

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 437
    .restart local v5       #_src:Ljava/lang/String;
    .restart local v6       #_dst:Ljava/lang/String;
    .restart local v14       #i:I
    .restart local v17       #j:I
    :cond_7
    add-int/lit8 v3, v14, 0x1

    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 442
    .end local v14           #i:I
    :cond_8
    move-object/from16 v6, p2

    goto :goto_2

    .line 460
    .restart local v18       #size_of_dst:J
    .restart local v20       #size_of_src:J
    :cond_9
    cmp-long v3, v20, v18

    if-nez v3, :cond_b

    .line 490
    .end local v5           #_src:Ljava/lang/String;
    .end local v6           #_dst:Ljava/lang/String;
    .end local v18           #size_of_dst:J
    .end local v20           #size_of_src:J
    :cond_a
    return-void

    .line 465
    .restart local v5       #_src:Ljava/lang/String;
    .restart local v6       #_dst:Ljava/lang/String;
    .restart local v18       #size_of_dst:J
    :cond_b
    if-eqz p3, :cond_c

    .line 466
    const/4 v4, 0x0

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v7

    move-object/from16 v3, p3

    invoke-interface/range {v3 .. v8}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 468
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_c

    .line 469
    move-object/from16 v0, p3

    move-wide/from16 v1, v18

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 472
    :cond_c
    const/4 v12, 0x0

    .line 474
    .local v12, fis:Ljava/io/FileInputStream;
    :try_start_4
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 475
    .end local v12           #fis:Ljava/io/FileInputStream;
    .local v13, fis:Ljava/io/FileInputStream;
    :try_start_5
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p4

    invoke-virtual {v0, v13, v6, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->_put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 478
    if-eqz v13, :cond_d

    .line 479
    :try_start_6
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    .line 426
    :cond_d
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_0

    .line 478
    .end local v13           #fis:Ljava/io/FileInputStream;
    .restart local v12       #fis:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v3

    :goto_4
    if-eqz v12, :cond_e

    .line 479
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V

    :cond_e
    throw v3
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 486
    .end local v5           #_src:Ljava/lang/String;
    .end local v6           #_dst:Ljava/lang/String;
    .end local v10           #dstsb:Ljava/lang/StringBuffer;
    .end local v12           #fis:Ljava/io/FileInputStream;
    .end local v16           #isRemoteDir:Z
    .end local v17           #j:I
    .end local v18           #size_of_dst:J
    .end local v22           #v:Ljava/util/Vector;
    .end local v23           #vsize:I
    .restart local v11       #e:Ljava/lang/Exception;
    :cond_f
    instance-of v3, v11, Ljava/lang/Throwable;

    if-eqz v3, :cond_10

    .line 487
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 488
    :cond_10
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 478
    .end local v11           #e:Ljava/lang/Exception;
    .restart local v5       #_src:Ljava/lang/String;
    .restart local v6       #_dst:Ljava/lang/String;
    .restart local v10       #dstsb:Ljava/lang/StringBuffer;
    .restart local v13       #fis:Ljava/io/FileInputStream;
    .restart local v16       #isRemoteDir:Z
    .restart local v17       #j:I
    .restart local v18       #size_of_dst:J
    .restart local v22       #v:Ljava/util/Vector;
    .restart local v23       #vsize:I
    :catchall_1
    move-exception v3

    move-object v12, v13

    .end local v13           #fis:Ljava/io/FileInputStream;
    .restart local v12       #fis:Ljava/io/FileInputStream;
    goto :goto_4

    .line 452
    .end local v12           #fis:Ljava/io/FileInputStream;
    :catch_1
    move-exception v3

    goto/16 :goto_3
.end method

.method public pwd()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2389
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public quit()V
    .locals 0

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    return-void
.end method

.method public readlink(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x68

    const/4 v8, 0x3

    const/4 v10, 0x4

    .line 1728
    :try_start_0
    iget v7, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-ge v7, v8, :cond_0

    .line 1729
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/16 v8, 0x8

    const-string v9, "The remote sshd is too old to support symlink operation."

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1767
    :catch_0
    move-exception v1

    .line 1768
    .local v1, e:Ljava/lang/Exception;
    instance-of v7, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v7, :cond_5

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 1733
    :cond_0
    :try_start_1
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v7, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1735
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1737
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1739
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/ChannelSftp;->sendREADLINK([B)V

    .line 1741
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1742
    .local v3, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 1743
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1744
    .local v5, length:I
    iget v6, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1746
    .local v6, type:I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1748
    const/16 v7, 0x65

    if-eq v6, v7, :cond_1

    if-eq v6, v9, :cond_1

    .line 1749
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    const-string v9, ""

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1751
    :cond_1
    if-ne v6, v9, :cond_4

    .line 1752
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    .line 1753
    .local v0, count:I
    const/4 v2, 0x0

    .line 1754
    .local v2, filename:[B
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v0, :cond_3

    .line 1755
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v2

    .line 1756
    iget v7, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-gt v7, v8, :cond_2

    .line 1757
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 1759
    :cond_2
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v7}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    .line 1754
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1761
    :cond_3
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v2, v7}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1773
    .end local v0           #count:I
    .end local v2           #filename:[B
    :goto_1
    return-object v7

    .line 1764
    .end local v4           #i:I
    :cond_4
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v4

    .line 1765
    .restart local v4       #i:I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v4}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1773
    const/4 v7, 0x0

    goto :goto_1

    .line 1769
    .end local v3           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #i:I
    .end local v5           #length:I
    .end local v6           #type:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_5
    instance-of v7, v1, Ljava/lang/Throwable;

    if-eqz v7, :cond_6

    .line 1770
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1771
    :cond_6
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
.end method

.method public realpath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    .line 2959
    :try_start_0
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v0

    .line 2960
    .local v0, _path:[B
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 2962
    .end local v0           #_path:[B
    :catch_0
    move-exception v1

    .line 2963
    .local v1, e:Ljava/lang/Exception;
    instance-of v2, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2964
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v2, v1, Ljava/lang/Throwable;

    if-eqz v2, :cond_1

    .line 2965
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 2966
    :cond_1
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public rename(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .parameter "oldpath"
    .parameter "newpath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v11, 0x4

    .line 1867
    iget v8, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-ge v8, v9, :cond_0

    .line 1868
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/16 v9, 0x8

    const-string v10, "The remote sshd is too old to support rename operation."

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1873
    :cond_0
    :try_start_0
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v8, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1875
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1876
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1878
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1880
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v6

    .line 1881
    .local v6, v:Ljava/util/Vector;
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    .line 1882
    .local v7, vsize:I
    if-lt v7, v9, :cond_1

    .line 1883
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    invoke-virtual {v6}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1912
    .end local v6           #v:Ljava/util/Vector;
    .end local v7           #vsize:I
    :catch_0
    move-exception v1

    .line 1913
    .local v1, e:Ljava/lang/Exception;
    instance-of v8, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v8, :cond_6

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 1885
    .restart local v6       #v:Ljava/util/Vector;
    .restart local v7       #vsize:I
    :cond_1
    const/4 v8, 0x1

    if-ne v7, v8, :cond_2

    .line 1886
    const/4 v8, 0x0

    :try_start_1
    invoke-virtual {v6, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 1894
    :goto_0
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendRENAME([B[B)V

    .line 1897
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1898
    .local v2, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 1899
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1900
    .local v4, length:I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1902
    .local v5, type:I
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1904
    const/16 v8, 0x65

    if-eq v5, v8, :cond_4

    .line 1905
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    const-string v10, ""

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1889
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #length:I
    .end local v5           #type:I
    :cond_2
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1890
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    invoke-direct {v8, v9, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1891
    :cond_3
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 1908
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #length:I
    .restart local v5       #type:I
    :cond_4
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 1909
    .local v3, i:I
    if-nez v3, :cond_5

    .line 1918
    :goto_1
    return-void

    .line 1910
    :cond_5
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 1914
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #i:I
    .end local v4           #length:I
    .end local v5           #type:I
    .end local v6           #v:Ljava/util/Vector;
    .end local v7           #vsize:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_6
    instance-of v8, v1, Ljava/lang/Throwable;

    if-eqz v8, :cond_7

    .line 1915
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const-string v9, ""

    invoke-direct {v8, v11, v9, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 1916
    :cond_7
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const-string v9, ""

    invoke-direct {v8, v11, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8
.end method

.method public rm(Ljava/lang/String;)V
    .locals 13
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    .line 1921
    :try_start_0
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v9, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1923
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1925
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v7

    .line 1926
    .local v7, v:Ljava/util/Vector;
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v8

    .line 1928
    .local v8, vsize:I
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1930
    .local v2, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    const/4 v4, 0x0

    .local v4, j:I
    :goto_0
    if-ge v4, v8, :cond_4

    .line 1931
    invoke-virtual {v7, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    move-object v0, v9

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 1932
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendREMOVE([B)V

    .line 1934
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 1935
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1936
    .local v5, length:I
    iget v6, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1938
    .local v6, type:I
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1940
    const/16 v9, 0x65

    if-eq v6, v9, :cond_0

    .line 1941
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const/4 v10, 0x4

    const-string v11, ""

    invoke-direct {v9, v10, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1949
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #j:I
    .end local v5           #length:I
    .end local v6           #type:I
    .end local v7           #v:Ljava/util/Vector;
    .end local v8           #vsize:I
    :catch_0
    move-exception v1

    .line 1950
    .local v1, e:Ljava/lang/Exception;
    instance-of v9, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v9, :cond_2

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 1943
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #j:I
    .restart local v5       #length:I
    .restart local v6       #type:I
    .restart local v7       #v:Ljava/util/Vector;
    .restart local v8       #vsize:I
    :cond_0
    :try_start_1
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 1944
    .local v3, i:I
    if-eqz v3, :cond_1

    .line 1945
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1930
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1951
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #i:I
    .end local v4           #j:I
    .end local v5           #length:I
    .end local v6           #type:I
    .end local v7           #v:Ljava/util/Vector;
    .end local v8           #vsize:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v9, v1, Ljava/lang/Throwable;

    if-eqz v9, :cond_3

    .line 1952
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1953
    :cond_3
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9

    .line 1955
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #j:I
    .restart local v7       #v:Ljava/util/Vector;
    .restart local v8       #vsize:I
    :cond_4
    return-void
.end method

.method public rmdir(Ljava/lang/String;)V
    .locals 13
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    .line 2084
    :try_start_0
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v9, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2086
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2088
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v7

    .line 2089
    .local v7, v:Ljava/util/Vector;
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v8

    .line 2091
    .local v8, vsize:I
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2093
    .local v2, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    const/4 v4, 0x0

    .local v4, j:I
    :goto_0
    if-ge v4, v8, :cond_4

    .line 2094
    invoke-virtual {v7, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    move-object v0, v9

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2095
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendRMDIR([B)V

    .line 2097
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2098
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2099
    .local v5, length:I
    iget v6, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2101
    .local v6, type:I
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2103
    const/16 v9, 0x65

    if-eq v6, v9, :cond_0

    .line 2104
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const/4 v10, 0x4

    const-string v11, ""

    invoke-direct {v9, v10, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2113
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #j:I
    .end local v5           #length:I
    .end local v6           #type:I
    .end local v7           #v:Ljava/util/Vector;
    .end local v8           #vsize:I
    :catch_0
    move-exception v1

    .line 2114
    .local v1, e:Ljava/lang/Exception;
    instance-of v9, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v9, :cond_2

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2107
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #j:I
    .restart local v5       #length:I
    .restart local v6       #type:I
    .restart local v7       #v:Ljava/util/Vector;
    .restart local v8       #vsize:I
    :cond_0
    :try_start_1
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2108
    .local v3, i:I
    if-eqz v3, :cond_1

    .line 2109
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 2093
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2115
    .end local v2           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3           #i:I
    .end local v4           #j:I
    .end local v5           #length:I
    .end local v6           #type:I
    .end local v7           #v:Ljava/util/Vector;
    .end local v8           #vsize:I
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v9, v1, Ljava/lang/Throwable;

    if-eqz v9, :cond_3

    .line 2116
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 2117
    :cond_3
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9

    .line 2119
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4       #j:I
    .restart local v7       #v:Ljava/util/Vector;
    .restart local v8       #vsize:I
    :cond_4
    return-void
.end method

.method public bridge synthetic run()V
    .locals 0

    .prologue
    .line 36
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public setBulkRequests(I)V
    .locals 3
    .parameter "bulk_requests"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 195
    if-lez p1, :cond_0

    .line 196
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-direct {v0, p0, p1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;-><init>(Lcom/jcraft/jsch/ChannelSftp;I)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    .line 200
    return-void

    .line 198
    :cond_0
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setBulkRequests: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must be greater than 0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public setFilenameEncoding(Ljava/lang/String;)V
    .locals 4
    .parameter "encoding"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2938
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getServerVersion()I

    move-result v0

    .line 2939
    .local v0, sversion:I
    const/4 v1, 0x3

    if-gt v1, v0, :cond_0

    const/4 v1, 0x5

    if-gt v0, v1, :cond_0

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2941
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, "The encoding can not be changed for this sftp server."

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2944
    :cond_0
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2945
    const-string p1, "UTF-8"

    .line 2947
    :cond_1
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    .line 2948
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    .line 2949
    return-void
.end method

.method public setMtime(Ljava/lang/String;I)V
    .locals 9
    .parameter "path"
    .parameter "mtime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2058
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2060
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2062
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2063
    .local v4, v:Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2064
    .local v5, vsize:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 2065
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2067
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2069
    .local v1, attr:Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2070
    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpATTRS;->getATime()I

    move-result v6

    invoke-virtual {v1, v6, p2}, Lcom/jcraft/jsch/SftpATTRS;->setACMODTIME(II)V

    .line 2071
    invoke-direct {p0, p1, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2064
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2074
    .end local v1           #attr:Lcom/jcraft/jsch/SftpATTRS;
    .end local v3           #j:I
    .end local v4           #v:Ljava/util/Vector;
    .end local v5           #vsize:I
    :catch_0
    move-exception v2

    .line 2075
    .local v2, e:Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_0

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2           #e:Ljava/lang/Exception;
    throw v2

    .line 2076
    .restart local v2       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 2077
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2078
    :cond_1
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2080
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v3       #j:I
    .restart local v4       #v:Ljava/util/Vector;
    .restart local v5       #vsize:I
    :cond_2
    return-void
.end method

.method public bridge synthetic setPty(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 36
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;IIII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 36
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    .locals 8
    .parameter "path"
    .parameter "attr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    .line 2344
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2346
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2348
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v3

    .line 2349
    .local v3, v:Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    .line 2350
    .local v4, vsize:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 2351
    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2352
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2350
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2355
    .end local v2           #j:I
    .end local v3           #v:Ljava/util/Vector;
    .end local v4           #vsize:I
    :catch_0
    move-exception v1

    .line 2356
    .local v1, e:Ljava/lang/Exception;
    instance-of v5, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_0

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 2357
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v5, v1, Ljava/lang/Throwable;

    if-eqz v5, :cond_1

    .line 2358
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v7, v6, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2359
    :cond_1
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v7, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 2361
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #j:I
    .restart local v3       #v:Ljava/util/Vector;
    .restart local v4       #vsize:I
    :cond_2
    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public bridge synthetic setXForwarding(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setXForwarding(Z)V

    return-void
.end method

.method public start()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 225
    :try_start_0
    new-instance v7, Ljava/io/PipedOutputStream;

    invoke-direct {v7}, Ljava/io/PipedOutputStream;-><init>()V

    .line 226
    .local v7, pos:Ljava/io/PipedOutputStream;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v10, v7}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 227
    new-instance v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    iget v10, p0, Lcom/jcraft/jsch/ChannelSftp;->rmpsize:I

    invoke-direct {v6, p0, v7, v10}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;I)V

    .line 228
    .local v6, pis:Ljava/io/PipedInputStream;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v10, v6}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 230
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    iget-object v10, v10, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    .line 232
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    if-nez v10, :cond_0

    .line 233
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    const-string v11, "channel is down"

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    .end local v6           #pis:Ljava/io/PipedInputStream;
    .end local v7           #pos:Ljava/io/PipedOutputStream;
    :catch_0
    move-exception v0

    .line 313
    .local v0, e:Ljava/lang/Exception;
    instance-of v10, v0, Lcom/jcraft/jsch/JSchException;

    if-eqz v10, :cond_6

    check-cast v0, Lcom/jcraft/jsch/JSchException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 236
    .restart local v6       #pis:Ljava/io/PipedInputStream;
    .restart local v7       #pos:Ljava/io/PipedOutputStream;
    :cond_0
    :try_start_1
    new-instance v8, Lcom/jcraft/jsch/RequestSftp;

    invoke-direct {v8}, Lcom/jcraft/jsch/RequestSftp;-><init>()V

    .line 237
    .local v8, request:Lcom/jcraft/jsch/Request;
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v10

    invoke-virtual {v8, v10, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 246
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    iget v11, p0, Lcom/jcraft/jsch/ChannelSftp;->lmpsize:I

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    .line 247
    new-instance v10, Lcom/jcraft/jsch/Packet;

    iget-object v11, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    .line 249
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    iget v11, p0, Lcom/jcraft/jsch/ChannelSftp;->rmpsize:I

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    .line 250
    new-instance v10, Lcom/jcraft/jsch/Packet;

    iget-object v11, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    .line 252
    const/4 v4, 0x0

    .line 258
    .local v4, i:I
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->sendINIT()V

    .line 261
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 262
    .local v3, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v10, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 263
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 264
    .local v5, length:I
    const/high16 v10, 0x4

    if-le v5, v10, :cond_1

    .line 265
    new-instance v10, Lcom/jcraft/jsch/SftpException;

    const/4 v11, 0x4

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received message is too long: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v10

    .line 268
    :cond_1
    iget v9, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 269
    .local v9, type:I
    iget v10, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    iput v10, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    .line 271
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    .line 272
    if-lez v5, :cond_2

    .line 274
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v10, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 275
    const/4 v2, 0x0

    .line 276
    .local v2, extension_name:[B
    const/4 v1, 0x0

    .line 277
    .local v1, extension_data:[B
    :goto_0
    if-lez v5, :cond_2

    .line 278
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v2

    .line 279
    array-length v10, v2

    add-int/lit8 v10, v10, 0x4

    sub-int/2addr v5, v10

    .line 280
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v1

    .line 281
    array-length v10, v1

    add-int/lit8 v10, v10, 0x4

    sub-int/2addr v5, v10

    .line 282
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 287
    .end local v1           #extension_data:[B
    .end local v2           #extension_name:[B
    :cond_2
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "posix-rename@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_3

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "posix-rename@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "1"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 289
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    .line 292
    :cond_3
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "statvfs@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "statvfs@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "2"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 294
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    .line 304
    :cond_4
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "hardlink@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "hardlink@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "1"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 306
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    .line 309
    :cond_5
    new-instance v10, Ljava/io/File;

    const-string v11, "."

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 318
    return-void

    .line 314
    .end local v3           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4           #i:I
    .end local v5           #length:I
    .end local v6           #pis:Ljava/io/PipedInputStream;
    .end local v7           #pos:Ljava/io/PipedOutputStream;
    .end local v8           #request:Lcom/jcraft/jsch/Request;
    .end local v9           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_6
    instance-of v10, v0, Ljava/lang/Throwable;

    if-eqz v10, :cond_7

    .line 315
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 316
    :cond_7
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v10
.end method

.method public stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .locals 4
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2154
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2156
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2157
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2159
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 2161
    :catch_0
    move-exception v0

    .line 2162
    .local v0, e:Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2163
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 2164
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2165
    :cond_1
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    .locals 4
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2207
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2209
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2210
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2212
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 2214
    :catch_0
    move-exception v0

    .line 2215
    .local v0, e:Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 2216
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_0
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 2217
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2218
    :cond_1
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public symlink(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "oldpath"
    .parameter "newpath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 1777
    iget v5, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v6, 0x3

    if-ge v5, v6, :cond_0

    .line 1778
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/16 v6, 0x8

    const-string v7, "The remote sshd is too old to support symlink operation."

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1783
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1785
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1786
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1788
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1790
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1791
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    invoke-direct {v5, v6, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1813
    :catch_0
    move-exception v0

    .line 1814
    .local v0, e:Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_4

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 1793
    :cond_1
    :try_start_1
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1795
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendSYMLINK([B[B)V

    .line 1798
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1799
    .local v1, header:Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 1800
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1801
    .local v3, length:I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1803
    .local v4, type:I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1805
    const/16 v5, 0x65

    if-eq v4, v5, :cond_2

    .line 1806
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1809
    :cond_2
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 1810
    .local v2, i:I
    if-nez v2, :cond_3

    .line 1819
    :goto_0
    return-void

    .line 1811
    :cond_3
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1815
    .end local v1           #header:Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #type:I
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_4
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_5

    .line 1816
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1817
    :cond_5
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method public version()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2391
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->version:Ljava/lang/String;

    return-object v0
.end method
