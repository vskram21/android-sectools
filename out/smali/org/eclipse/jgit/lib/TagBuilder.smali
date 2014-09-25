.class public Lorg/eclipse/jgit/lib/TagBuilder;
.super Ljava/lang/Object;
.source "TagBuilder.java"


# instance fields
.field private message:Ljava/lang/String;

.field private object:Lorg/eclipse/jgit/lib/ObjectId;

.field private tag:Ljava/lang/String;

.field private tagger:Lorg/eclipse/jgit/lib/PersonIdent;

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->type:I

    return-void
.end method


# virtual methods
.method public build()[B
    .locals 4

    .prologue
    .line 162
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 163
    .local v1, os:Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/OutputStreamWriter;

    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v2, v1, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 165
    .local v2, w:Ljava/io/OutputStreamWriter;
    :try_start_0
    const-string v3, "object "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 166
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo(Ljava/io/Writer;)V

    .line 167
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 169
    const-string v3, "type "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getObjectType()I

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 171
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 173
    const-string v3, "tag "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 175
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getTagger()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 178
    const-string v3, "tagger "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 179
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getTagger()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 180
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 183
    :cond_0
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 184
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 185
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 186
    :cond_1
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 187
    :catch_0
    move-exception v0

    .line 191
    .local v0, err:Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->object:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getObjectType()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->type:I

    return v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getTagger()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "newMessage"

    .prologue
    .line 152
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->message:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 1
    .parameter "obj"
    .parameter "objType"

    .prologue
    .line 94
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/TagBuilder;->object:Lorg/eclipse/jgit/lib/ObjectId;

    .line 95
    iput p2, p0, Lorg/eclipse/jgit/lib/TagBuilder;->type:I

    .line 96
    return-void
.end method

.method public setObjectId(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "obj"

    .prologue
    .line 105
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/TagBuilder;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    .line 106
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0
    .parameter "shortName"

    .prologue
    .line 122
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tag:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public setTagger(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 0
    .parameter "taggerIdent"

    .prologue
    .line 137
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 138
    return-void
.end method

.method public toByteArray()[B
    .locals 1

    .prologue
    .line 203
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TagBuilder;->build()[B

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    .local v0, r:Ljava/lang/StringBuilder;
    const-string v1, "Tag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    const-string v1, "={\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    const-string v1, "object "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->object:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->object:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    const-string v1, "type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->object:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v1, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->type:I

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    const-string v1, "tag "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tag:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tag:Ljava/lang/String;

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    if-eqz v1, :cond_0

    .line 226
    const-string v1, "tagger "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 228
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    :cond_0
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->message:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TagBuilder;->message:Ljava/lang/String;

    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 214
    :cond_1
    const-string v1, "NOT_SET"

    goto :goto_0

    .line 218
    :cond_2
    const-string v1, "NOT_SET"

    goto :goto_1

    .line 222
    :cond_3
    const-string v1, "NOT_SET"

    goto :goto_2

    .line 232
    :cond_4
    const-string v1, ""

    goto :goto_3
.end method
