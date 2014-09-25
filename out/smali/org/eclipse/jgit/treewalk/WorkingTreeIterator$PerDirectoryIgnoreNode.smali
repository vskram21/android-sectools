.class Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;
.super Lorg/eclipse/jgit/ignore/IgnoreNode;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PerDirectoryIgnoreNode"
.end annotation


# instance fields
.field final entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V
    .locals 1
    .parameter "entry"

    .prologue
    .line 1133
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/ignore/IgnoreNode;-><init>(Ljava/util/List;)V

    .line 1134
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;->entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 1135
    return-void
.end method


# virtual methods
.method load()Lorg/eclipse/jgit/ignore/IgnoreNode;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1138
    new-instance v1, Lorg/eclipse/jgit/ignore/IgnoreNode;

    invoke-direct {v1}, Lorg/eclipse/jgit/ignore/IgnoreNode;-><init>()V

    .line 1139
    .local v1, r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;->entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 1141
    .local v0, in:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/ignore/IgnoreNode;->parse(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1143
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1145
    invoke-virtual {v1}, Lorg/eclipse/jgit/ignore/IgnoreNode;->getRules()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    .end local v1           #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    :cond_0
    return-object v1

    .line 1143
    .restart local v1       #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
.end method
