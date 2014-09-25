.class Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;
.super Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RootIgnoreNode"
.end annotation


# instance fields
.field final repository:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "entry"
    .parameter "repository"

    .prologue
    .line 1154
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V

    .line 1155
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 1156
    return-void
.end method

.method private static loadRulesFromFile(Lorg/eclipse/jgit/ignore/IgnoreNode;Ljava/io/File;)V
    .locals 2
    .parameter "r"
    .parameter "exclude"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1190
    sget-object v1, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1191
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1193
    .local v0, in:Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/ignore/IgnoreNode;->parse(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1195
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 1198
    .end local v0           #in:Ljava/io/FileInputStream;
    :cond_0
    return-void

    .line 1195
    .restart local v0       #in:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v1
.end method


# virtual methods
.method load()Lorg/eclipse/jgit/ignore/IgnoreNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1161
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    if-eqz v5, :cond_3

    .line 1162
    invoke-super {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;->load()Lorg/eclipse/jgit/ignore/IgnoreNode;

    move-result-object v4

    .line 1163
    .local v4, r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    if-nez v4, :cond_0

    .line 1164
    new-instance v4, Lorg/eclipse/jgit/ignore/IgnoreNode;

    .end local v4           #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    invoke-direct {v4}, Lorg/eclipse/jgit/ignore/IgnoreNode;-><init>()V

    .line 1169
    .restart local v4       #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    :cond_0
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    .line 1170
    .local v2, fs:Lorg/eclipse/jgit/util/FS;
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v5

    sget-object v7, Lorg/eclipse/jgit/lib/CoreConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v5, v7}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/CoreConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/CoreConfig;->getExcludesFile()Ljava/lang/String;

    move-result-object v3

    .line 1172
    .local v3, path:Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 1174
    const-string v5, "~/"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1175
    invoke-virtual {v2}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v5

    const/4 v7, 0x2

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v5, v7}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 1178
    .local v1, excludesfile:Ljava/io/File;
    :goto_1
    invoke-static {v4, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->loadRulesFromFile(Lorg/eclipse/jgit/ignore/IgnoreNode;Ljava/io/File;)V

    .line 1181
    .end local v1           #excludesfile:Ljava/io/File;
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v5

    const-string v7, "info/exclude"

    invoke-virtual {v2, v5, v7}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1183
    .local v0, exclude:Ljava/io/File;
    invoke-static {v4, v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;->loadRulesFromFile(Lorg/eclipse/jgit/ignore/IgnoreNode;Ljava/io/File;)V

    .line 1185
    invoke-virtual {v4}, Lorg/eclipse/jgit/ignore/IgnoreNode;->getRules()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    move-object v4, v6

    .end local v4           #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    :cond_2
    return-object v4

    .line 1166
    .end local v0           #exclude:Ljava/io/File;
    .end local v2           #fs:Lorg/eclipse/jgit/util/FS;
    .end local v3           #path:Ljava/lang/String;
    :cond_3
    new-instance v4, Lorg/eclipse/jgit/ignore/IgnoreNode;

    invoke-direct {v4}, Lorg/eclipse/jgit/ignore/IgnoreNode;-><init>()V

    .restart local v4       #r:Lorg/eclipse/jgit/ignore/IgnoreNode;
    goto :goto_0

    .line 1177
    .restart local v2       #fs:Lorg/eclipse/jgit/util/FS;
    .restart local v3       #path:Ljava/lang/String;
    :cond_4
    invoke-virtual {v2, v6, v3}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .restart local v1       #excludesfile:Ljava/io/File;
    goto :goto_1
.end method
