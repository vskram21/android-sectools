.class public Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter;
.super Ljava/lang/Object;
.source "MessageRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$PatternSearch;,
        Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$SubStringSearch;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    return-void
.end method

.method public static create(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "pattern"

    .prologue
    .line 71
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->cannotMatchOnEmptyString:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->safe(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$SubStringSearch;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$SubStringSearch;-><init>(Ljava/lang/String;)V

    .line 75
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$PatternSearch;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/MessageRevFilter$PatternSearch;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static textFor(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;
    .locals 4
    .parameter "cmit"

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getRawBuffer()[B

    move-result-object v1

    .line 84
    .local v1, raw:[B
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->commitMessage([BI)I

    move-result v0

    .line 85
    .local v0, b:I
    if-gez v0, :cond_0

    .line 86
    sget-object v2, Lorg/eclipse/jgit/util/RawCharSequence;->EMPTY:Lorg/eclipse/jgit/util/RawCharSequence;

    .line 87
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lorg/eclipse/jgit/util/RawCharSequence;

    array-length v3, v1

    invoke-direct {v2, v1, v0, v3}, Lorg/eclipse/jgit/util/RawCharSequence;-><init>([BII)V

    goto :goto_0
.end method
