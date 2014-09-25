.class public Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "SkipRevFilter.java"


# instance fields
.field private count:I

.field private final skip:I


# direct methods
.method private constructor <init>(I)V
    .locals 0
    .parameter "skip"

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 78
    iput p1, p0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->skip:I

    .line 79
    return-void
.end method

.method public static create(I)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "skip"

    .prologue
    .line 71
    if-gez p0, :cond_0

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->skipMustBeNonNegative:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;-><init>(I)V

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
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2

    .prologue
    .line 92
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->skip:I

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;-><init>(I)V

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 3
    .parameter "walker"
    .parameter "cmit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/StopWalkException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget v0, p0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->skip:I

    iget v1, p0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->count:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->count:I

    if-le v0, v1, :cond_0

    .line 86
    const/4 v0, 0x0

    .line 87
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
