.class Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;
.super Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;
.source "RevFlagFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HasAny"
.end annotation


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V
    .locals 0
    .parameter "m"

    .prologue
    .line 156
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    .line 157
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
    .line 154
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 1
    .parameter "walker"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;->flags:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->hasAny(Lorg/eclipse/jgit/revwalk/RevFlagSet;)Z

    move-result v0

    return v0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x0

    return v0
.end method
