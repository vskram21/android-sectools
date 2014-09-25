.class public Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "NotRevFilter.java"


# instance fields
.field private final a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V
    .locals 0
    .parameter "one"

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 70
    return-void
.end method

.method public static create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "a"

    .prologue
    .line 63
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    return-object v0
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
    .line 54
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2

    .prologue
    .line 91
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

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
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public negate()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    return-object v0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->requiresCommitBody()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NOT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
