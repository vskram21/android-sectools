.class Lorg/eclipse/jgit/transport/SideBandInputStream;
.super Ljava/io/InputStream;
.source "SideBandInputStream.java"


# static fields
.field static final CH_DATA:I = 0x1

.field static final CH_ERROR:I = 0x3

.field static final CH_PROGRESS:I = 0x2

.field private static final PFX_REMOTE:Ljava/lang/String;

.field private static P_BOUNDED:Ljava/util/regex/Pattern;

.field private static P_UNBOUNDED:Ljava/util/regex/Pattern;


# instance fields
.field private available:I

.field private channel:I

.field private currentTask:Ljava/lang/String;

.field private eof:Z

.field private lastCnt:I

.field private final messages:Ljava/io/Writer;

.field private final monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final out:Ljava/io/OutputStream;

.field private final pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

.field private progressBuffer:Ljava/lang/String;

.field private final rawIn:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->prefixRemote:Ljava/lang/String;

    sput-object v0, Lorg/eclipse/jgit/transport/SideBandInputStream;->PFX_REMOTE:Ljava/lang/String;

    .line 89
    const-string v0, "^([\\w ]+): +(\\d+)(?:, done\\.)? *[\r\n]$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/transport/SideBandInputStream;->P_UNBOUNDED:Ljava/util/regex/Pattern;

    .line 92
    const-string v0, "^([\\w ]+): +\\d+% +\\( *(\\d+)/ *(\\d+)\\)(?:, done\\.)? *[\r\n]$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/transport/SideBandInputStream;->P_BOUNDED:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/Writer;Ljava/io/OutputStream;)V
    .locals 2
    .parameter "in"
    .parameter "progress"
    .parameter "messageStream"
    .parameter "outputStream"

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->progressBuffer:Ljava/lang/String;

    .line 119
    iput-object p1, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    .line 120
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 121
    iput-object p2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 122
    iput-object p3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->messages:Ljava/io/Writer;

    .line 123
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    .line 124
    iput-object p4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->out:Ljava/io/OutputStream;

    .line 125
    return-void
.end method

.method private beginTask(I)V
    .locals 3
    .parameter "totalWorkUnits"

    .prologue
    .line 244
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/eclipse/jgit/transport/SideBandInputStream;->PFX_REMOTE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 245
    return-void
.end method

.method private doProgressLine(Ljava/lang/String;)V
    .locals 7
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 210
    sget-object v3, Lorg/eclipse/jgit/transport/SideBandInputStream;->P_BOUNDED:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 211
    .local v1, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 212
    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 213
    .local v2, taskname:Ljava/lang/String;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 214
    iput-object v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    .line 215
    iput v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    .line 216
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/SideBandInputStream;->beginTask(I)V

    .line 218
    :cond_0
    invoke-virtual {v1, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 219
    .local v0, cnt:I
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    sub-int v4, v0, v4

    invoke-interface {v3, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 220
    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    .line 241
    .end local v0           #cnt:I
    .end local v2           #taskname:Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 224
    :cond_2
    sget-object v3, Lorg/eclipse/jgit/transport/SideBandInputStream;->P_UNBOUNDED:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 225
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 226
    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 227
    .restart local v2       #taskname:Ljava/lang/String;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 228
    iput-object v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->currentTask:Ljava/lang/String;

    .line 229
    iput v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    .line 230
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/SideBandInputStream;->beginTask(I)V

    .line 232
    :cond_3
    invoke-virtual {v1, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 233
    .restart local v0       #cnt:I
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    sub-int v4, v0, v4

    invoke-interface {v3, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 234
    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->lastCnt:I

    goto :goto_0

    .line 238
    .end local v0           #cnt:I
    .end local v2           #taskname:Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->messages:Ljava/io/Writer;

    invoke-virtual {v3, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 239
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->out:Ljava/io/OutputStream;

    if-eqz v3, :cond_1

    .line 240
    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0
.end method

.method private needDataPacket()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 155
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    if-nez v0, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->channel:I

    if-ne v0, v2, :cond_2

    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    if-lez v0, :cond_2

    .line 171
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 164
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->channel:I

    .line 165
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    add-int/lit8 v0, v0, -0x5

    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    .line 166
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    if-nez v0, :cond_3

    .line 158
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readLength()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    .line 159
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    if-nez v0, :cond_1

    .line 160
    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    goto :goto_0

    .line 169
    :cond_3
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->channel:I

    packed-switch v0, :pswitch_data_0

    .line 179
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidChannel:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->channel:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :pswitch_1
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/SideBandInputStream;->readString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/SideBandInputStream;->progress(Ljava/lang/String;)V

    goto :goto_1

    .line 176
    :pswitch_2
    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    .line 177
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/eclipse/jgit/transport/SideBandInputStream;->PFX_REMOTE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/SideBandInputStream;->readString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private progress(Ljava/lang/String;)V
    .locals 5
    .parameter "pkt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->progressBuffer:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 189
    :goto_0
    const/16 v3, 0xa

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 190
    .local v1, lf:I
    const/16 v3, 0xd

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 192
    .local v0, cr:I
    if-ltz v1, :cond_0

    if-ltz v0, :cond_0

    .line 193
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 201
    .local v2, s:I
    :goto_1
    const/4 v3, 0x0

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/SideBandInputStream;->doProgressLine(Ljava/lang/String;)V

    .line 202
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 203
    goto :goto_0

    .line 194
    .end local v2           #s:I
    :cond_0
    if-ltz v1, :cond_1

    .line 195
    move v2, v1

    .restart local v2       #s:I
    goto :goto_1

    .line 196
    .end local v2           #s:I
    :cond_1
    if-ltz v0, :cond_2

    .line 197
    move v2, v0

    .restart local v2       #s:I
    goto :goto_1

    .line 204
    .end local v2           #s:I
    :cond_2
    iput-object p1, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->progressBuffer:Ljava/lang/String;

    .line 205
    return-void
.end method

.method private readString(I)Ljava/lang/String;
    .locals 3
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 248
    new-array v0, p1, [B

    .line 249
    .local v0, raw:[B
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    invoke-static {v1, v0, v2, p1}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 250
    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v1, v0, v2, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SideBandInputStream;->needDataPacket()V

    .line 130
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    if-eqz v0, :cond_0

    .line 131
    const/4 v0, -0x1

    .line 133
    :goto_0
    return v0

    .line 132
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0
.end method

.method public read([BII)I
    .locals 4
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v1, 0x0

    .line 139
    .local v1, r:I
    :goto_0
    if-lez p3, :cond_0

    .line 140
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SideBandInputStream;->needDataPacket()V

    .line 141
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    if-eqz v2, :cond_2

    .line 151
    :cond_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->eof:Z

    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    const/4 v1, -0x1

    .end local v1           #r:I
    :cond_1
    return v1

    .line 143
    .restart local v1       #r:I
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->rawIn:Ljava/io/InputStream;

    iget v3, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v2, p1, p2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 144
    .local v0, n:I
    if-ltz v0, :cond_0

    .line 146
    add-int/2addr v1, v0

    .line 147
    add-int/2addr p2, v0

    .line 148
    sub-int/2addr p3, v0

    .line 149
    iget v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    sub-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/transport/SideBandInputStream;->available:I

    goto :goto_0
.end method
