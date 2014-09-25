.class public Lorg/eclipse/jgit/ignore/IgnoreRule;
.super Ljava/lang/Object;
.source "IgnoreRule.java"


# instance fields
.field private dirOnly:Z

.field private matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

.field private nameOnly:Z

.field private negation:Z

.field private pattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "pattern"

    .prologue
    const/4 v0, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    .line 71
    iput-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->negation:Z

    .line 72
    iput-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->nameOnly:Z

    .line 73
    iput-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->dirOnly:Z

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    .line 75
    invoke-direct {p0}, Lorg/eclipse/jgit/ignore/IgnoreRule;->setup()V

    .line 76
    return-void
.end method

.method private doesMatchDirectoryExpectations(ZII)Z
    .locals 2
    .parameter "isDirectory"
    .parameter "segmentIdx"
    .parameter "segmentLength"

    .prologue
    const/4 v0, 0x1

    .line 251
    add-int/lit8 v1, p3, -0x1

    if-ge p2, v1, :cond_1

    .line 256
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-boolean v1, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->dirOnly:Z

    if-eqz v1, :cond_0

    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setup()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 83
    const/4 v2, 0x0

    .line 84
    .local v2, startIndex:I
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .line 85
    .local v0, endIndex:I
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "!"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    add-int/lit8 v2, v2, 0x1

    .line 87
    iput-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->negation:Z

    .line 90
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 91
    add-int/lit8 v0, v0, -0x1

    .line 92
    iput-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->dirOnly:Z

    .line 95
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    .line 96
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 98
    .local v1, hasSlash:Z
    if-nez v1, :cond_5

    .line 99
    iput-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->nameOnly:Z

    .line 106
    :cond_2
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 108
    :cond_3
    :try_start_0
    new-instance v3, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    iget-object v4, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const/16 v5, 0x2f

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/lang/String;Ljava/lang/Character;)V

    iput-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/InvalidPatternException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :cond_4
    :goto_1
    return-void

    .line 100
    :cond_5
    iget-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 103
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    goto :goto_0

    .line 109
    :catch_0
    move-exception v3

    goto :goto_1
.end method


# virtual methods
.method public dirOnly()Z
    .locals 1

    .prologue
    .line 130
    iget-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->dirOnly:Z

    return v0
.end method

.method public getNameOnly()Z
    .locals 1

    .prologue
    .line 121
    iget-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->nameOnly:Z

    return v0
.end method

.method public getNegation()Z
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->negation:Z

    return v0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Z
    .locals 1

    .prologue
    .line 246
    iget-boolean v0, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->negation:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMatch(Ljava/lang/String;Z)Z
    .locals 8
    .parameter "target"
    .parameter "isDirectory"

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 167
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 168
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 170
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    if-nez v5, :cond_6

    .line 171
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 173
    iget-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->dirOnly:Z

    if-eqz v5, :cond_2

    if-nez p2, :cond_2

    .line 234
    :cond_1
    :goto_0
    return v3

    :cond_2
    move v3, v4

    .line 178
    goto :goto_0

    .line 186
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v3, v4

    .line 187
    goto :goto_0

    .line 189
    :cond_4
    iget-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->nameOnly:Z

    if-eqz v5, :cond_1

    .line 191
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 192
    .local v2, segments:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, idx:I
    :goto_1
    array-length v5, v2

    if-ge v0, v5, :cond_1

    .line 193
    aget-object v1, v2, v0

    .line 194
    .local v1, segmentName:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->pattern:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    array-length v5, v2

    invoke-direct {p0, p2, v0, v5}, Lorg/eclipse/jgit/ignore/IgnoreRule;->doesMatchDirectoryExpectations(ZII)Z

    move-result v5

    if-eqz v5, :cond_5

    move v3, v4

    .line 196
    goto :goto_0

    .line 192
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 201
    .end local v0           #idx:I
    .end local v1           #segmentName:Ljava/lang/String;
    .end local v2           #segments:[Ljava/lang/String;
    :cond_6
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->reset()V

    .line 202
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->append(Ljava/lang/String;)V

    .line 203
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->isMatch()Z

    move-result v5

    if-eqz v5, :cond_7

    move v3, v4

    .line 204
    goto :goto_0

    .line 206
    :cond_7
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 207
    .restart local v2       #segments:[Ljava/lang/String;
    iget-boolean v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->nameOnly:Z

    if-eqz v5, :cond_9

    .line 208
    const/4 v0, 0x0

    .restart local v0       #idx:I
    :goto_2
    array-length v5, v2

    if-ge v0, v5, :cond_1

    .line 209
    aget-object v1, v2, v0

    .line 211
    .restart local v1       #segmentName:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->reset()V

    .line 212
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->append(Ljava/lang/String;)V

    .line 213
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->isMatch()Z

    move-result v5

    if-eqz v5, :cond_8

    array-length v5, v2

    invoke-direct {p0, p2, v0, v5}, Lorg/eclipse/jgit/ignore/IgnoreRule;->doesMatchDirectoryExpectations(ZII)Z

    move-result v5

    if-eqz v5, :cond_8

    move v3, v4

    .line 215
    goto/16 :goto_0

    .line 208
    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 220
    .end local v0           #idx:I
    .end local v1           #segmentName:Ljava/lang/String;
    :cond_9
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->reset()V

    .line 221
    const/4 v0, 0x0

    .restart local v0       #idx:I
    :goto_3
    array-length v5, v2

    if-ge v0, v5, :cond_1

    .line 222
    aget-object v1, v2, v0

    .line 223
    .restart local v1       #segmentName:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_a

    .line 224
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->append(Ljava/lang/String;)V

    .line 227
    :cond_a
    iget-object v5, p0, Lorg/eclipse/jgit/ignore/IgnoreRule;->matcher:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-virtual {v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->isMatch()Z

    move-result v5

    if-eqz v5, :cond_b

    array-length v5, v2

    invoke-direct {p0, p2, v0, v5}, Lorg/eclipse/jgit/ignore/IgnoreRule;->doesMatchDirectoryExpectations(ZII)Z

    move-result v5

    if-eqz v5, :cond_b

    move v3, v4

    .line 229
    goto/16 :goto_0

    .line 221
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method
