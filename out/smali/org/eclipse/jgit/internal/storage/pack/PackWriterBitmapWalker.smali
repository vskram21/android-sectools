.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
.super Ljava/lang/Object;
.source "PackWriterBitmapWalker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;
    }
.end annotation


# instance fields
.field private final bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;

.field private final pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/ObjectWalk;Lorg/eclipse/jgit/lib/BitmapIndex;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 0
    .parameter "walker"
    .parameter "bitmapIndex"
    .parameter "pm"

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    .line 77
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;

    .line 78
    if-nez p3, :cond_0

    sget-object p3, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .end local p3
    :cond_0
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 79
    return-void
.end method

.method static newRevFilter(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "seen"
    .parameter "bitmapResult"

    .prologue
    .line 125
    if-eqz p0, :cond_0

    .line 126
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$1;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$1;-><init>(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)V

    .line 134
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$2;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$2;-><init>(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)V

    goto :goto_0
.end method


# virtual methods
.method findObjects(Ljava/util/Set;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .locals 9
    .parameter
    .parameter "seen"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ")",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, start:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v8, 0x1

    .line 84
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/BitmapIndex;->newBitmapBuilder()Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-result-object v1

    .line 86
    .local v1, bitmapResult:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/ObjectId;

    .line 87
    .local v4, obj:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;

    invoke-interface {v6, v4}, Lorg/eclipse/jgit/lib/BitmapIndex;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;

    move-result-object v0

    .line 88
    .local v0, bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    if-eqz v0, :cond_0

    .line 89
    invoke-interface {v1, v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    goto :goto_0

    .line 92
    .end local v0           #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .end local v4           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    const/4 v3, 0x0

    .line 93
    .local v3, marked:Z
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/ObjectId;

    .line 94
    .restart local v4       #obj:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-interface {v1, v4}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 95
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 96
    const/4 v3, 0x1

    goto :goto_1

    .line 100
    .end local v4           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    if-eqz v3, :cond_5

    .line 101
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    invoke-static {p2, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->newRevFilter(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 103
    :goto_2
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 106
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v6, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_2

    .line 110
    :cond_4
    :goto_3
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    .local v5, ro:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v5, :cond_5

    .line 111
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v6

    invoke-interface {v1, v5, v6}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    .line 112
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v6, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_3

    .line 116
    .end local v5           #ro:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_5
    return-object v1
.end method

.method reset()V
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->walker:Lorg/eclipse/jgit/revwalk/ObjectWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reset()V

    .line 121
    return-void
.end method
