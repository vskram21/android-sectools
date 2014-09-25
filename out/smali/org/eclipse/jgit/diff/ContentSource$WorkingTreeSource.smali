.class Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;
.super Lorg/eclipse/jgit/diff/ContentSource;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/ContentSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WorkingTreeSource"
.end annotation


# instance fields
.field private current:Ljava/lang/String;

.field private final iterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

.field private ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

.field private final tw:Lorg/eclipse/jgit/treewalk/TreeWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 2
    .parameter "iterator"

    .prologue
    .line 153
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/ContentSource;-><init>()V

    .line 154
    new-instance v1, Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v0, 0x0

    check-cast v0, Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v1, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 156
    iput-object p1, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->iterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 157
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    return-object v0
.end method

.method private seek(Ljava/lang/String;)V
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->current:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 202
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->iterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->reset()V

    .line 203
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset()V

    .line 204
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->iterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 206
    iput-object p1, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->current:Ljava/lang/String;

    .line 207
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v0

    if-nez v0, :cond_0

    .line 208
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->tw:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v1, 0x0

    const-class v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    iput-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 210
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-nez v0, :cond_1

    .line 211
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_1
    return-void
.end method


# virtual methods
.method public open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 1
    .parameter "path"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->seek(Ljava/lang/String;)V

    .line 168
    new-instance v0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource$1;-><init>(Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;)V

    return-object v0
.end method

.method public size(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)J
    .locals 2
    .parameter "path"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->seek(Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;->ptr:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v0

    return-wide v0
.end method
