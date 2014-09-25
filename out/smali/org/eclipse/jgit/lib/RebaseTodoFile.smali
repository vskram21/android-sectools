.class public Lorg/eclipse/jgit/lib/RebaseTodoFile;
.super Ljava/lang/Object;
.source "RebaseTodoFile.java"


# instance fields
.field private repo:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RebaseTodoFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    .line 72
    return-void
.end method

.method private static nextParsableToken([BII)I
    .locals 2
    .parameter "buf"
    .parameter "tokenBegin"
    .parameter "lineEnd"

    .prologue
    .line 162
    :goto_0
    if-gt p1, p2, :cond_1

    aget-byte v0, p0, p1

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    aget-byte v0, p0, p1

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    aget-byte v0, p0, p1

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1

    .line 164
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 165
    :cond_1
    if-le p1, p2, :cond_2

    .line 166
    const/4 p1, -0x1

    .line 167
    .end local p1
    :cond_2
    return p1
.end method

.method private static parseComments([BILjava/util/List;I)V
    .locals 5
    .parameter "buf"
    .parameter "tokenBegin"
    .parameter
    .parameter "lineEnd"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p2, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    const/4 v2, 0x0

    .line 127
    .local v2, line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    add-int/lit8 v4, p3, 0x1

    invoke-static {p0, p1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, commentString:Ljava/lang/String;
    add-int/lit8 v3, p1, 0x1

    .line 131
    .local v3, skip:I
    :try_start_0
    invoke-static {p0, v3, p3}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->nextParsableToken([BII)I

    move-result v3

    .line 132
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 134
    invoke-static {p0, v3, p3}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->parseLine([BII)Lorg/eclipse/jgit/lib/RebaseTodoLine;

    move-result-object v2

    .line 137
    sget-object v4, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->setAction(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;)V

    .line 139
    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->setComment(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :cond_0
    if-nez v2, :cond_1

    .line 146
    new-instance v2, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .end local v2           #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    invoke-direct {v2, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Ljava/lang/String;)V

    .line 147
    .restart local v2       #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_1
    :goto_0
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    return-void

    .line 141
    :catch_0
    move-exception v1

    .line 143
    .local v1, e:Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 145
    if-nez v2, :cond_1

    .line 146
    new-instance v2, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .end local v2           #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    invoke-direct {v2, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Ljava/lang/String;)V

    .restart local v2       #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    goto :goto_0

    .line 145
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    if-nez v2, :cond_2

    .line 146
    new-instance v2, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .end local v2           #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    invoke-direct {v2, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Ljava/lang/String;)V

    .line 147
    .restart local v2       #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_2
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    throw v4
.end method

.method private static parseLine([BII)Lorg/eclipse/jgit/lib/RebaseTodoLine;
    .locals 9
    .parameter "buf"
    .parameter "tokenBegin"
    .parameter "lineEnd"

    .prologue
    const/4 v6, 0x0

    const/16 v8, 0x20

    .line 172
    const/4 v0, 0x0

    .line 173
    .local v0, action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    const/4 v2, 0x0

    .line 175
    .local v2, commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    invoke-static {p0, p1, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v4

    .line 176
    .local v4, nextSpace:I
    const/4 v5, 0x0

    .line 177
    .local v5, tokenCount:I
    :goto_0
    const/4 v7, 0x3

    if-ge v5, v7, :cond_2

    if-ge v4, p2, :cond_2

    .line 178
    packed-switch v5, :pswitch_data_0

    .line 198
    :cond_0
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 180
    :pswitch_0
    new-instance v1, Ljava/lang/String;

    sub-int v7, v4, p1

    add-int/lit8 v7, v7, -0x1

    invoke-direct {v1, p0, p1, v7}, Ljava/lang/String;-><init>([BII)V

    .line 182
    .local v1, actionToken:Ljava/lang/String;
    move p1, v4

    .line 183
    invoke-static {v1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->parse(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v0

    .line 184
    if-nez v0, :cond_0

    .line 202
    .end local v1           #actionToken:Ljava/lang/String;
    :cond_1
    :goto_2
    return-object v6

    .line 188
    :pswitch_1
    invoke-static {p0, p1, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v4

    .line 189
    new-instance v3, Ljava/lang/String;

    sub-int v7, v4, p1

    add-int/lit8 v7, v7, -0x1

    invoke-direct {v3, p0, p1, v7}, Ljava/lang/String;-><init>([BII)V

    .line 191
    .local v3, commitToken:Ljava/lang/String;
    move p1, v4

    .line 192
    invoke-static {v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    .line 193
    goto :goto_1

    .line 195
    .end local v3           #commitToken:Ljava/lang/String;
    :pswitch_2
    new-instance v6, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    add-int/lit8 v7, p2, 0x1

    invoke-static {p0, p1, v7}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v0, v2, v7}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/String;)V

    goto :goto_2

    .line 200
    :cond_2
    const/4 v7, 0x2

    if-ne v5, v7, :cond_1

    .line 201
    new-instance v6, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    const-string v7, ""

    invoke-direct {v6, v0, v2, v7}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/String;)V

    goto :goto_2

    .line 178
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;
    .locals 9
    .parameter "path"
    .parameter "includeComments"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lorg/eclipse/jgit/lib/RebaseTodoFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v8

    invoke-direct {v7, v8, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v7}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v0

    .line 90
    .local v0, buf:[B
    const/4 v4, 0x0

    .line 91
    .local v4, ptr:I
    const/4 v6, 0x0

    .line 92
    .local v6, tokenBegin:I
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 93
    .local v5, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    :cond_0
    :goto_0
    array-length v7, v0

    if-ge v4, v7, :cond_4

    .line 94
    move v6, v4

    .line 95
    invoke-static {v0, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v4

    .line 96
    move v3, v6

    .line 97
    .local v3, lineStart:I
    add-int/lit8 v2, v4, -0x2

    .line 98
    .local v2, lineEnd:I
    if-ltz v2, :cond_1

    aget-byte v7, v0, v2

    const/16 v8, 0xd

    if-ne v7, v8, :cond_1

    .line 99
    add-int/lit8 v2, v2, -0x1

    .line 101
    :cond_1
    aget-byte v7, v0, v6

    const/16 v8, 0x23

    if-ne v7, v8, :cond_2

    .line 102
    if-eqz p2, :cond_0

    .line 103
    invoke-static {v0, v6, v5, v2}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->parseComments([BILjava/util/List;I)V

    goto :goto_0

    .line 106
    :cond_2
    invoke-static {v0, v6, v2}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->nextParsableToken([BII)I

    move-result v6

    .line 109
    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    .line 110
    if-eqz p2, :cond_0

    .line 111
    new-instance v7, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    add-int/lit8 v8, v2, 0x1

    invoke-static {v0, v3, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    :cond_3
    invoke-static {v0, v6, v2}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->parseLine([BII)Lorg/eclipse/jgit/lib/RebaseTodoLine;

    move-result-object v1

    .line 116
    .local v1, line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    if-eqz v1, :cond_0

    .line 118
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 121
    .end local v1           #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    .end local v2           #lineEnd:I
    .end local v3           #lineStart:I
    :cond_4
    return-object v5
.end method

.method public writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 8
    .parameter "path"
    .parameter
    .parameter "append"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    .local p2, steps:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    new-instance v5, Ljava/io/FileOutputStream;

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/eclipse/jgit/lib/RebaseTodoFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v7

    invoke-direct {v6, v7, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v5, v6, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 223
    .local v0, fw:Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .local v2, sb:Ljava/lang/StringBuilder;
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .line 225
    .local v3, step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 226
    sget-object v4, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    iget-object v5, v3, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 227
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getComment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 236
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 239
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #sb:Ljava/lang/StringBuilder;
    .end local v3           #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V

    throw v4

    .line 229
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #sb:Ljava/lang/StringBuilder;
    .restart local v3       #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->toToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getCommit()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getShortMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 239
    .end local v3           #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_1
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V

    .line 241
    return-void
.end method
