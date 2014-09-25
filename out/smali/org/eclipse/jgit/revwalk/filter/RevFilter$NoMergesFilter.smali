.class final Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "RevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoMergesFilter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 149
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 149
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;-><init>()V

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
    .line 149
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 157
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "walker"
    .parameter "c"

    .prologue
    .line 152
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    const-string v0, "NO_MERGES"

    return-object v0
.end method
