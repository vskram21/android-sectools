.class Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;
.super Lorg/eclipse/jgit/lib/ObjectInserter;
.source "ObjectDirectoryInserter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter$1;
    }
.end annotation


# instance fields
.field private final config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

.field private final db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

.field private deflate:Ljava/util/zip/Deflater;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/lib/Config;)V
    .locals 1
    .parameter "dest"
    .parameter "cfg"

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;-><init>()V

    .line 79
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    .line 80
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/lib/Config;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    .line 81
    return-void
.end method

.method private insertOneObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4
    .parameter "tmp"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ObjectWritingException;
        }
    .end annotation

    .prologue
    .line 113
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter$1;->$SwitchMap$org$eclipse$jgit$internal$storage$file$FileObjectDatabase$InsertLooseObjectResult:[I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, p2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->insertUnpackedObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;Z)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 124
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v0

    .line 125
    .local v0, dst:Ljava/io/File;
    new-instance v1, Lorg/eclipse/jgit/errors/ObjectWritingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to create new object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/ObjectWritingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    .end local v0           #dst:Ljava/io/File;
    :pswitch_0
    return-object p2

    .line 113
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static shortInput(J)Ljava/io/EOFException;
    .locals 3
    .parameter "missing"

    .prologue
    .line 239
    new-instance v0, Ljava/io/EOFException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Input did not match supplied length. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes are missing."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private toTemp(I[BII)Ljava/io/File;
    .locals 9
    .parameter "type"
    .parameter "buf"
    .parameter "pos"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    .line 192
    const/4 v1, 0x1

    .line 193
    .local v1, delete:Z
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->newTempFile()Ljava/io/File;

    move-result-object v4

    .line 195
    .local v4, tmp:Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 197
    .local v2, fOut:Ljava/io/FileOutputStream;
    move-object v3, v2

    .line 198
    .local v3, out:Ljava/io/OutputStream;
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 199
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5

    invoke-static {v5}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;

    move-result-object v3

    .line 200
    :cond_0
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->compress(Ljava/io/OutputStream;)Ljava/util/zip/DeflaterOutputStream;

    move-result-object v0

    .line 201
    .local v0, cOut:Ljava/util/zip/DeflaterOutputStream;
    int-to-long v5, p4

    invoke-virtual {p0, v0, p1, v5, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->writeHeader(Ljava/io/OutputStream;IJ)V

    .line 202
    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/DeflaterOutputStream;->write([BII)V

    .line 203
    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->finish()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    :try_start_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 206
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 207
    :cond_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 210
    const/4 v1, 0x0

    .line 213
    if-eqz v1, :cond_2

    .line 214
    invoke-static {v4, v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_2
    return-object v4

    .line 205
    .end local v0           #cOut:Ljava/util/zip/DeflaterOutputStream;
    :catchall_0
    move-exception v5

    :try_start_3
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 206
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 207
    :cond_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 213
    .end local v2           #fOut:Ljava/io/FileOutputStream;
    .end local v3           #out:Ljava/io/OutputStream;
    :catchall_1
    move-exception v5

    if-eqz v1, :cond_4

    .line 214
    invoke-static {v4, v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_4
    throw v5
.end method

.method private toTemp(Ljava/security/MessageDigest;IJLjava/io/InputStream;)Ljava/io/File;
    .locals 13
    .parameter "md"
    .parameter "type"
    .parameter "len"
    .parameter "is"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;,
            Ljava/lang/Error;
        }
    .end annotation

    .prologue
    .line 153
    const/4 v5, 0x1

    .line 154
    .local v5, delete:Z
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->newTempFile()Ljava/io/File;

    move-result-object v9

    .line 156
    .local v9, tmp:Ljava/io/File;
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 158
    .local v6, fOut:Ljava/io/FileOutputStream;
    move-object v8, v6

    .line 159
    .local v8, out:Ljava/io/OutputStream;
    :try_start_1
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 160
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v10

    invoke-static {v10}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;

    move-result-object v8

    .line 161
    :cond_0
    invoke-virtual {p0, v8}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->compress(Ljava/io/OutputStream;)Ljava/util/zip/DeflaterOutputStream;

    move-result-object v3

    .line 162
    .local v3, cOut:Ljava/util/zip/DeflaterOutputStream;
    new-instance v4, Ljava/security/DigestOutputStream;

    invoke-direct {v4, v3, p1}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 163
    .local v4, dOut:Ljava/security/DigestOutputStream;
    move-wide/from16 v0, p3

    invoke-virtual {p0, v4, p2, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->writeHeader(Ljava/io/OutputStream;IJ)V

    .line 165
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->buffer()[B

    move-result-object v2

    .line 166
    .local v2, buf:[B
    :goto_0
    const-wide/16 v10, 0x0

    cmp-long v10, p3, v10

    if-lez v10, :cond_4

    .line 167
    const/4 v10, 0x0

    array-length v11, v2

    int-to-long v11, v11

    move-wide/from16 v0, p3

    invoke-static {v0, v1, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    long-to-int v11, v11

    move-object/from16 v0, p5

    invoke-virtual {v0, v2, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    .line 168
    .local v7, n:I
    if-gtz v7, :cond_3

    .line 169
    invoke-static/range {p3 .. p4}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->shortInput(J)Ljava/io/EOFException;

    move-result-object v10

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    .end local v2           #buf:[B
    .end local v3           #cOut:Ljava/util/zip/DeflaterOutputStream;
    .end local v4           #dOut:Ljava/security/DigestOutputStream;
    .end local v7           #n:I
    :catchall_0
    move-exception v10

    :try_start_2
    iget-object v11, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v11}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 177
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 178
    :cond_1
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    throw v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 184
    .end local v6           #fOut:Ljava/io/FileOutputStream;
    .end local v8           #out:Ljava/io/OutputStream;
    :catchall_1
    move-exception v10

    if-eqz v5, :cond_2

    .line 185
    const/4 v11, 0x2

    invoke-static {v9, v11}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_2
    throw v10

    .line 170
    .restart local v2       #buf:[B
    .restart local v3       #cOut:Ljava/util/zip/DeflaterOutputStream;
    .restart local v4       #dOut:Ljava/security/DigestOutputStream;
    .restart local v6       #fOut:Ljava/io/FileOutputStream;
    .restart local v7       #n:I
    .restart local v8       #out:Ljava/io/OutputStream;
    :cond_3
    const/4 v10, 0x0

    :try_start_3
    invoke-virtual {v4, v2, v10, v7}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 171
    int-to-long v10, v7

    sub-long p3, p3, v10

    .line 172
    goto :goto_0

    .line 173
    .end local v7           #n:I
    :cond_4
    invoke-virtual {v4}, Ljava/security/DigestOutputStream;->flush()V

    .line 174
    invoke-virtual {v3}, Ljava/util/zip/DeflaterOutputStream;->finish()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 176
    :try_start_4
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncObjectFiles()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 177
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 178
    :cond_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 181
    const/4 v5, 0x0

    .line 184
    if-eqz v5, :cond_6

    .line 185
    const/4 v10, 0x2

    invoke-static {v9, v10}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_6
    return-object v9
.end method


# virtual methods
.method compress(Ljava/io/OutputStream;)Ljava/util/zip/DeflaterOutputStream;
    .locals 3
    .parameter "out"

    .prologue
    .line 231
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    if-nez v0, :cond_0

    .line 232
    new-instance v0, Ljava/util/zip/Deflater;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->config:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getCompression()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    .line 235
    :goto_0
    new-instance v0, Ljava/util/zip/DeflaterOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    const/16 v2, 0x2000

    invoke-direct {v0, p1, v1, v2}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;I)V

    return-object v0

    .line 234
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    goto :goto_0
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    return-void
.end method

.method public insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 10
    .parameter "type"
    .parameter "len"
    .parameter "is"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 98
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->buffer()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v2, v0

    cmp-long v0, p2, v2

    if-gtz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->buffer()[B

    move-result-object v7

    .line 100
    .local v7, buf:[B
    invoke-static {p4, v7, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BI)I

    move-result v6

    .line 101
    .local v6, actLen:I
    invoke-virtual {p0, p1, v7, v4, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 107
    .end local v6           #actLen:I
    .end local v7           #buf:[B
    :goto_0
    return-object v0

    .line 104
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->digest()Ljava/security/MessageDigest;

    move-result-object v1

    .local v1, md:Ljava/security/MessageDigest;
    move-object v0, p0

    move v2, p1

    move-wide v3, p2

    move-object v5, p4

    .line 105
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->toTemp(Ljava/security/MessageDigest;IJLjava/io/InputStream;)Ljava/io/File;

    move-result-object v9

    .line 106
    .local v9, tmp:Ljava/io/File;
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    .line 107
    .local v8, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, v9, v8}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->insertOneObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    goto :goto_0
.end method

.method public insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 87
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 91
    .end local v0           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_0
    return-object v0

    .line 90
    .restart local v0       #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->toTemp(I[BII)Ljava/io/File;

    move-result-object v1

    .line 91
    .local v1, tmp:Ljava/io/File;
    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->insertOneObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    goto :goto_0
.end method

.method public newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;
    .locals 2
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-direct {v0, v1, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Ljava/io/InputStream;)V

    return-object v0
.end method

.method newTempFile()Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    const-string v0, "noz"

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getDirectory()Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    if-eqz v0, :cond_0

    .line 142
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    .line 147
    :cond_0
    return-void

    .line 144
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;->deflate:Ljava/util/zip/Deflater;

    throw v0
.end method

.method writeHeader(Ljava/io/OutputStream;IJ)V
    .locals 1
    .parameter "out"
    .parameter "type"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 221
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 222
    invoke-static {p3, p4}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 223
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 224
    return-void
.end method
