.class public Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter;
.super Ljava/lang/Object;
.source "CommitterRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;,
        Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$SubStringSearch;
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
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$SubStringSearch;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$SubStringSearch;-><init>(Ljava/lang/String;)V

    .line 75
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static textFor(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;
    .locals 4
    .parameter "cmit"

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getRawBuffer()[B

    move-result-object v2

    .line 84
    .local v2, raw:[B
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->committer([BI)I

    move-result v0

    .line 85
    .local v0, b:I
    if-gez v0, :cond_0

    .line 86
    sget-object v3, Lorg/eclipse/jgit/util/RawCharSequence;->EMPTY:Lorg/eclipse/jgit/util/RawCharSequence;

    .line 88
    :goto_0
    return-object v3

    .line 87
    :cond_0
    const/16 v3, 0x3e

    invoke-static {v2, v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 88
    .local v1, e:I
    new-instance v3, Lorg/eclipse/jgit/util/RawCharSequence;

    invoke-direct {v3, v2, v0, v1}, Lorg/eclipse/jgit/util/RawCharSequence;-><init>([BII)V

    goto :goto_0
.end method
