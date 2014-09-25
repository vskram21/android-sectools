.class abstract Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "PackWriterBitmapWalker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BitmapRevFilter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 142
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public final clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 156
    return-object p0
.end method

.method public final include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 5
    .parameter "walker"
    .parameter "cmit"

    .prologue
    .line 147
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;->load(Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 148
    const/4 v4, 0x1

    .line 151
    :goto_0
    return v4

    .line 149
    :cond_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 150
    .local v3, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 149
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 151
    .end local v3           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method protected abstract load(Lorg/eclipse/jgit/revwalk/RevCommit;)Z
.end method

.method public final requiresCommitBody()Z
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x0

    return v0
.end method
