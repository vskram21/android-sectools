.class public abstract Lorg/eclipse/jgit/transport/BasePackPushConnection;
.super Lorg/eclipse/jgit/transport/BasePackConnection;
.source "BasePackPushConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PushConnection;


# static fields
.field public static final CAPABILITY_DELETE_REFS:Ljava/lang/String; = "delete-refs"

.field public static final CAPABILITY_OFS_DELTA:Ljava/lang/String; = "ofs-delta"

.field public static final CAPABILITY_REPORT_STATUS:Ljava/lang/String; = "report-status"

.field public static final CAPABILITY_SIDE_BAND_64K:Ljava/lang/String; = "side-band-64k"


# instance fields
.field private capableDeleteRefs:Z

.field private capableOfsDelta:Z

.field private capableReport:Z

.field private capableSideBand:Z

.field private packTransferTime:J

.field private sentCommand:Z

.field private final thinPack:Z

.field private writePack:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/transport/PackTransport;)V
    .locals 1
    .parameter "packTransport"

    .prologue
    .line 135
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/Transport;->isPushThin()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->thinPack:Z

    .line 137
    return-void
.end method

.method private enableCapabilities(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)Ljava/lang/String;
    .locals 5
    .parameter "monitor"
    .parameter "outputStream"

    .prologue
    const/4 v4, 0x0

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v0, line:Ljava/lang/StringBuilder;
    const-string v1, "report-status"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableReport:Z

    .line 262
    const-string v1, "delete-refs"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableDeleteRefs:Z

    .line 263
    const-string v1, "ofs-delta"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableOfsDelta:Z

    .line 265
    const-string v1, "side-band-64k"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableSideBand:Z

    .line 266
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableSideBand:Z

    if-eqz v1, :cond_0

    .line 267
    new-instance v1, Lorg/eclipse/jgit/transport/SideBandInputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->in:Ljava/io/InputStream;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->getMessageWriter()Ljava/io/Writer;

    move-result-object v3

    invoke-direct {v1, v2, p1, v3, p2}, Lorg/eclipse/jgit/transport/SideBandInputStream;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/Writer;Ljava/io/OutputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->in:Ljava/io/InputStream;

    .line 269
    new-instance v1, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->in:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 272
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 273
    invoke-virtual {v0, v4, v4}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 274
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private readStatusReport(Ljava/util/Map;)V
    .locals 14
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 314
    .local p1, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->readStringLongTimeout()Ljava/lang/String;

    move-result-object v7

    .line 315
    .local v7, unpackLine:Ljava/lang/String;
    const-string v9, "unpack "

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 316
    new-instance v9, Lorg/eclipse/jgit/errors/PackProtocolException;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->unexpectedReportLine:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v7, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v9

    .line 317
    :cond_0
    const-string v9, "unpack "

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 318
    .local v8, unpackStatus:Ljava/lang/String;
    const-string v9, "ok"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 319
    new-instance v9, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->errorOccurredDuringUnpackingOnTheRemoteEnd:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v9

    .line 343
    .local v1, message:Ljava/lang/String;
    .local v2, ok:Z
    .local v3, refLine:Ljava/lang/String;
    .local v4, refName:Ljava/lang/String;
    .local v5, refNameEnd:I
    .local v6, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_1
    if-eqz v2, :cond_7

    .line 344
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v6, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 323
    .end local v1           #message:Ljava/lang/String;
    .end local v2           #ok:Z
    .end local v3           #refLine:Ljava/lang/String;
    .end local v4           #refName:Ljava/lang/String;
    .end local v5           #refNameEnd:I
    .end local v6           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_2
    :goto_0
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;

    move-result-object v3

    .restart local v3       #refLine:Ljava/lang/String;
    sget-object v9, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-eq v3, v9, :cond_8

    .line 324
    const/4 v2, 0x0

    .line 325
    .restart local v2       #ok:Z
    const/4 v5, -0x1

    .line 326
    .restart local v5       #refNameEnd:I
    const-string v9, "ok "

    invoke-virtual {v3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 327
    const/4 v2, 0x1

    .line 328
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    .line 333
    :cond_3
    :goto_1
    const/4 v9, -0x1

    if-ne v5, v9, :cond_5

    .line 334
    new-instance v9, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->unexpectedReportLine2:Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v3, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 329
    :cond_4
    const-string v9, "ng "

    invoke-virtual {v3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 330
    const/4 v2, 0x0

    .line 331
    const-string v9, " "

    const/4 v10, 0x3

    invoke-virtual {v3, v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    goto :goto_1

    .line 336
    :cond_5
    const/4 v9, 0x3

    invoke-virtual {v3, v9, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 337
    .restart local v4       #refName:Ljava/lang/String;
    if-eqz v2, :cond_6

    const/4 v1, 0x0

    .line 340
    .restart local v1       #message:Ljava/lang/String;
    :goto_2
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 341
    .restart local v6       #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    if-nez v6, :cond_1

    .line 342
    new-instance v9, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->unexpectedRefReport:Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v4, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 337
    .end local v1           #message:Ljava/lang/String;
    .end local v6           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_6
    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 346
    .restart local v1       #message:Ljava/lang/String;
    .restart local v6       #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_7
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v6, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 347
    invoke-virtual {v6, v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 350
    .end local v1           #message:Ljava/lang/String;
    .end local v2           #ok:Z
    .end local v4           #refName:Ljava/lang/String;
    .end local v5           #refNameEnd:I
    .end local v6           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_8
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 351
    .restart local v6       #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getStatus()Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    move-result-object v9

    sget-object v10, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->AWAITING_REPORT:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    if-ne v9, v10, :cond_9

    .line 352
    new-instance v9, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->expectedReportForRefNotReceived:Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 355
    .end local v6           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_a
    return-void
.end method

.method private readStringLongTimeout()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    if-nez v2, :cond_0

    .line 359
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;

    move-result-object v2

    .line 375
    :goto_0
    return-object v2

    .line 369
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->getTimeout()I

    move-result v0

    .line 370
    .local v0, oldTimeout:I
    iget-wide v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->packTransferTime:J

    const-wide/32 v4, 0x1b77400

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v1, v2

    .line 372
    .local v1, sendTime:I
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    mul-int/lit8 v3, v3, 0xa

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 373
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 375
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    goto :goto_0

    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    throw v2
.end method

.method private writeCommands(Ljava/util/Collection;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    .locals 10
    .parameter
    .parameter "monitor"
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, refUpdates:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/16 v9, 0x20

    const/4 v8, 0x1

    .line 225
    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->enableCapabilities(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, capabilities:Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 227
    .local v4, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableDeleteRefs:Z

    if-nez v6, :cond_1

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isDelete()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 228
    sget-object v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NODELETE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto :goto_0

    .line 232
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .local v5, sb:Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 234
    .local v0, advertisedRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v0, :cond_3

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 236
    .local v3, oldId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 240
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->sentCommand:Z

    if-nez v6, :cond_2

    .line 242
    iput-boolean v8, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->sentCommand:Z

    .line 243
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 247
    sget-object v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->AWAITING_REPORT:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 248
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isDelete()Z

    move-result v6

    if-nez v6, :cond_0

    .line 249
    iput-boolean v8, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->writePack:Z

    goto :goto_0

    .line 234
    .end local v3           #oldId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    goto :goto_1

    .line 252
    .end local v0           #advertisedRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v4           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    .end local v5           #sb:Ljava/lang/StringBuilder;
    :cond_4
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 253
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->pushCancelled:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v6

    .line 254
    :cond_5
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 255
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->outNeedsEnd:Z

    .line 256
    return-void
.end method

.method private writePack(Ljava/util/Map;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 8
    .parameter
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    .local p1, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 280
    .local v4, remoteObjects:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 282
    .local v1, newObjects:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/Transport;->getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 286
    .local v5, writer:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->getRefs()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 288
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 289
    .local v2, oid:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/lib/Repository;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 290
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 307
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v2           #oid:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v6

    .line 292
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->additionalHaves:Ljava/util/Set;

    invoke-interface {v4, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 293
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 294
    .local v3, r:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 295
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 298
    .end local v3           #r:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_3
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setIndexDisabled(Z)V

    .line 299
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setUseCachedPacks(Z)V

    .line 300
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setUseBitmaps(Z)V

    .line 301
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->thinPack:Z

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setThin(Z)V

    .line 302
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseValidatingObjects(Z)V

    .line 303
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableOfsDelta:Z

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 304
    invoke-virtual {v5, p2, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 305
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v5, p2, p2, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 309
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTimeWriting()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->packTransferTime:J

    .line 310
    return-void
.end method


# virtual methods
.method public bridge synthetic close()V
    .locals 0

    .prologue
    .line 85
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->close()V

    return-void
.end method

.method protected doPush(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    .locals 8
    .parameter "monitor"
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 195
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    :try_start_0
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {p0, v2, p1, p3}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->writeCommands(Ljava/util/Collection;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V

    .line 196
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->writePack:Z

    if-eqz v2, :cond_0

    .line 197
    invoke-direct {p0, p2, p1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->writePack(Ljava/util/Map;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 198
    :cond_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->sentCommand:Z

    if-eqz v2, :cond_2

    .line 199
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableReport:Z

    if-eqz v2, :cond_1

    .line 200
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->readStatusReport(Ljava/util/Map;)V

    .line 201
    :cond_1
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->capableSideBand:Z

    if-eqz v2, :cond_2

    .line 207
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 208
    .local v0, b:I
    if-ltz v0, :cond_2

    .line 209
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->expectedEOFReceived:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    int-to-char v7, v0

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 214
    .end local v0           #b:I
    :catch_0
    move-exception v1

    .line 215
    .local v1, e:Lorg/eclipse/jgit/errors/TransportException;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    .end local v1           #e:Lorg/eclipse/jgit/errors/TransportException;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->close()V

    throw v2

    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->close()V

    .line 221
    return-void

    .line 216
    :catch_1
    move-exception v1

    .line 217
    .local v1, e:Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method protected noRepository()Lorg/eclipse/jgit/errors/TransportException;
    .locals 3

    .prologue
    .line 165
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Transport;->openFetch()Lorg/eclipse/jgit/transport/FetchConnection;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/transport/FetchConnection;->close()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/eclipse/jgit/errors/NoRemoteRepositoryException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_1

    .line 175
    :goto_0
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->pushNotPermitted:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    :goto_1
    return-object v0

    .line 168
    :catch_0
    move-exception v0

    .line 171
    .local v0, e:Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    goto :goto_1

    .line 172
    .end local v0           #e:Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    :catch_1
    move-exception v1

    goto :goto_0

    .line 166
    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;)V
    .locals 1
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 142
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V

    .line 143
    return-void
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    .locals 0
    .parameter "monitor"
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 151
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->markStartedOperation()V

    .line 152
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->doPush(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V

    .line 153
    return-void
.end method
