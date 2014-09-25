.class Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;
.super Lorg/eclipse/jgit/lib/ObjectLoader;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)V
    .locals 0
    .parameter

    .prologue
    .line 168
    iput-object p1, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public getCachedBytes()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 195
    new-instance v0, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {v0}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    throw v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    #getter for: Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    invoke-static {v0}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->access$000(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    #getter for: Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    invoke-static {v0}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->access$000(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v0

    return v0
.end method

.method public isLarge()Z
    .locals 1

    .prologue
    .line 190
    const/4 v0, 0x1

    return v0
.end method

.method public openStream()Lorg/eclipse/jgit/lib/ObjectStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v4, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    #getter for: Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    invoke-static {v4}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->access$000(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryContentLength()J

    move-result-wide v0

    .line 183
    .local v0, contentLength:J
    iget-object v4, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->this$0:Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    #getter for: Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    invoke-static {v4}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->access$000(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->openEntryStream()Ljava/io/InputStream;

    move-result-object v2

    .line 184
    .local v2, in:Ljava/io/InputStream;
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 185
    .end local v2           #in:Ljava/io/InputStream;
    .local v3, in:Ljava/io/InputStream;
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectStream$Filter;

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;->getType()I

    move-result v5

    invoke-direct {v4, v5, v0, v1, v3}, Lorg/eclipse/jgit/lib/ObjectStream$Filter;-><init>(IJLjava/io/InputStream;)V

    return-object v4
.end method
