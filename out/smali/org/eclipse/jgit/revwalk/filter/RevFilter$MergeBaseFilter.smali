.class final Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "RevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MergeBaseFilter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 181
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 181
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;-><init>()V

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
    .line 181
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 189
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "walker"
    .parameter "c"

    .prologue
    .line 184
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->cannotBeCombined:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 194
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    const-string v0, "MERGE_BASE"

    return-object v0
.end method
