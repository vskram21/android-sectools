.class public Lorg/eclipse/jgit/transport/RefSpec;
.super Ljava/lang/Object;
.source "RefSpec.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final WILDCARD_SUFFIX:Ljava/lang/String; = "/*"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private dstName:Ljava/lang/String;

.field private force:Z

.field private srcName:Ljava/lang/String;

.field private wildcard:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->force:Z

    .line 99
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 100
    const-string v0, "HEAD"

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 8
    .parameter "spec"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    move-object v2, p1

    .line 126
    .local v2, s:Ljava/lang/String;
    const-string v4, "+"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 127
    iput-boolean v6, p0, Lorg/eclipse/jgit/transport/RefSpec;->force:Z

    .line 128
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 131
    :cond_0
    const/16 v4, 0x3a

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 132
    .local v0, c:I
    if-nez v0, :cond_2

    .line 133
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 134
    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 135
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->invalidWildcards:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 136
    :cond_1
    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 155
    :goto_0
    return-void

    .line 137
    :cond_2
    if-lez v0, :cond_6

    .line 138
    invoke-virtual {v2, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, src:Ljava/lang/String;
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, dst:Ljava/lang/String;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 142
    iput-boolean v6, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 148
    :cond_3
    invoke-static {v3}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 149
    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    goto :goto_0

    .line 143
    :cond_4
    invoke-static {v3}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 146
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->invalidWildcards:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 151
    .end local v1           #dst:Ljava/lang/String;
    .end local v3           #src:Ljava/lang/String;
    :cond_6
    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 152
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->invalidWildcards:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 153
    :cond_7
    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    goto :goto_0
.end method

.method private constructor <init>(Lorg/eclipse/jgit/transport/RefSpec;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->force:Z

    .line 159
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 160
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 161
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 162
    return-void
.end method

.method private static checkValid(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "spec"

    .prologue
    .line 445
    if-eqz p0, :cond_0

    invoke-static {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isValid(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 446
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidRefSpec:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 448
    :cond_0
    return-object p0
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 493
    if-ne p0, p1, :cond_0

    .line 494
    const/4 v0, 0x1

    .line 497
    :goto_0
    return v0

    .line 495
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 496
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 497
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private expandFromDstImp(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 3
    .parameter "name"

    .prologue
    .line 399
    iget-object v1, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .local v1, psrc:Ljava/lang/String;
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 400
    .local v0, pdst:Ljava/lang/String;
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 401
    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->expandWildcard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 402
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 403
    return-object p0
.end method

.method private expandFromSourceImp(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 3
    .parameter "name"

    .prologue
    .line 357
    iget-object v1, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .local v1, psrc:Ljava/lang/String;
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 358
    .local v0, pdst:Ljava/lang/String;
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 359
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 360
    invoke-static {p1, v1, v0}, Lorg/eclipse/jgit/transport/RefSpec;->expandWildcard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 361
    return-object p0
.end method

.method private static expandWildcard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "name"
    .parameter "patternA"
    .parameter "patternB"

    .prologue
    const/16 v6, 0x2a

    .line 437
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 438
    .local v0, a:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v0, 0x1

    sub-int v3, v4, v5

    .line 439
    .local v3, trailingA:I
    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 440
    .local v1, b:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 441
    .local v2, match:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p2, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static isValid(Ljava/lang/String;)Z
    .locals 5
    .parameter "s"

    .prologue
    const/16 v4, 0x2f

    const/16 v3, 0x2a

    const/4 v1, 0x0

    .line 452
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 465
    :cond_0
    :goto_0
    return v1

    .line 454
    :cond_1
    const-string v2, "//"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 456
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 457
    .local v0, i:I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 458
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-gt v2, v0, :cond_0

    .line 460
    if-lez v0, :cond_2

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_0

    .line 462
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_3

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_0

    .line 465
    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isWildcard(Ljava/lang/String;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 76
    if-eqz p0, :cond_0

    const-string v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private match(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .parameter "name"
    .parameter "s"

    .prologue
    const/4 v3, 0x0

    .line 423
    if-nez p2, :cond_1

    .line 432
    :cond_0
    :goto_0
    return v3

    .line 425
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 426
    const/16 v4, 0x2a

    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 427
    .local v2, wildcardIndex:I
    invoke-virtual {p2, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 428
    .local v0, prefix:Ljava/lang/String;
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 429
    .local v1, suffix:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    if-le v4, v5, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    .line 432
    .end local v0           #prefix:Ljava/lang/String;
    .end local v1           #suffix:Ljava/lang/String;
    .end local v2           #wildcardIndex:I
    :cond_2
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 478
    instance-of v2, p1, Lorg/eclipse/jgit/transport/RefSpec;

    if-nez v2, :cond_1

    .line 489
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 480
    check-cast v0, Lorg/eclipse/jgit/transport/RefSpec;

    .line 481
    .local v0, b:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v3

    if-ne v2, v3, :cond_0

    .line 483
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v3

    if-ne v2, v3, :cond_0

    .line 485
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/RefSpec;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 487
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/RefSpec;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 489
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public expandFromDestination(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 1
    .parameter "r"

    .prologue
    .line 395
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromDstImp(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object p0

    .end local p0
    :cond_0
    return-object p0
.end method

.method public expandFromDestination(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 1
    .parameter "r"

    .prologue
    .line 419
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromDestination(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v0

    return-object v0
.end method

.method public expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 1
    .parameter "r"

    .prologue
    .line 353
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSourceImp(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object p0

    .end local p0
    :cond_0
    return-object p0
.end method

.method public expandFromSource(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 1
    .parameter "r"

    .prologue
    .line 378
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v0

    return-object v0
.end method

.method public getDestination()Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 469
    const/4 v0, 0x0

    .line 470
    .local v0, hc:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 471
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x0

    .line 472
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 473
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 474
    :cond_1
    return v0
.end method

.method public isForceUpdate()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->force:Z

    return v0
.end method

.method public isWildcard()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    return v0
.end method

.method public matchDestination(Ljava/lang/String;)Z
    .locals 1
    .parameter "r"

    .prologue
    .line 325
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/RefSpec;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public matchDestination(Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 2
    .parameter "r"

    .prologue
    .line 336
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public matchSource(Ljava/lang/String;)Z
    .locals 1
    .parameter "r"

    .prologue
    .line 303
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/RefSpec;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public matchSource(Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 2
    .parameter "r"

    .prologue
    .line 314
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setDestination(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 3
    .parameter "destination"

    .prologue
    .line 263
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 264
    .local v0, r:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 265
    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 266
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->sourceIsNotAWildcard:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 267
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v2

    if-eq v1, v2, :cond_1

    .line 268
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->sourceDestinationMustMatch:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    :cond_1
    return-object v0
.end method

.method public setForceUpdate(Z)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 1
    .parameter "forceUpdate"

    .prologue
    .line 181
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 182
    .local v0, r:Lorg/eclipse/jgit/transport/RefSpec;
    iput-boolean p1, v0, Lorg/eclipse/jgit/transport/RefSpec;->force:Z

    .line 183
    return-object v0
.end method

.method public setSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 3
    .parameter "source"

    .prologue
    .line 224
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 225
    .local v0, r:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/RefSpec;->checkValid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 226
    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 227
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->destinationIsNotAWildcard:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 228
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    invoke-static {v2}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v2

    if-eq v1, v2, :cond_1

    .line 229
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->sourceDestinationMustMatch:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 230
    :cond_1
    return-object v0
.end method

.method public setSourceDestination(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;
    .locals 3
    .parameter "source"
    .parameter "destination"

    .prologue
    .line 286
    invoke-static {p1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    invoke-static {p2}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v2

    if-eq v1, v2, :cond_0

    .line 287
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->sourceDestinationMustMatch:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 288
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 289
    .local v0, r:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, v0, Lorg/eclipse/jgit/transport/RefSpec;->wildcard:Z

    .line 290
    iput-object p1, v0, Lorg/eclipse/jgit/transport/RefSpec;->srcName:Ljava/lang/String;

    .line 291
    iput-object p2, v0, Lorg/eclipse/jgit/transport/RefSpec;->dstName:Ljava/lang/String;

    .line 292
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 501
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 502
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 503
    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 504
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 505
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 507
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 508
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
