.class public Lorg/eclipse/jgit/merge/MergeConfig;
.super Ljava/lang/Object;
.source "MergeConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/merge/MergeConfig$1;,
        Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;
    }
.end annotation


# instance fields
.field private final commit:Z

.field private final fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

.field private final squash:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    iput-object v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->squash:Z

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->commit:Z

    .line 104
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;)V
    .locals 2
    .parameter "branch"
    .parameter "config"

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    invoke-static {p1, p2}, Lorg/eclipse/jgit/merge/MergeConfig;->getMergeOptions(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;)[Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, mergeOptions:[Ljava/lang/String;
    invoke-static {p2, v0}, Lorg/eclipse/jgit/merge/MergeConfig;->getFastForwardMode(Lorg/eclipse/jgit/lib/Config;[Ljava/lang/String;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/merge/MergeConfig;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 96
    const-string v1, "--squash"

    invoke-static {v1, v0}, Lorg/eclipse/jgit/merge/MergeConfig;->isMergeConfigOptionSet(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/merge/MergeConfig;->squash:Z

    .line 97
    const-string v1, "--no-commit"

    invoke-static {v1, v0}, Lorg/eclipse/jgit/merge/MergeConfig;->isMergeConfigOptionSet(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lorg/eclipse/jgit/merge/MergeConfig;->commit:Z

    .line 98
    return-void

    .line 97
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/merge/MergeConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/merge/MergeConfig;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method

.method public static getConfigForCurrentBranch(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/MergeConfig;
    .locals 3
    .parameter "repo"

    .prologue
    .line 66
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getBranch()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, branch:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeConfig;->getParser(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Config$SectionParser;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/merge/MergeConfig;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .end local v0           #branch:Ljava/lang/String;
    :goto_0
    return-object v1

    .line 69
    :catch_0
    move-exception v1

    .line 73
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/merge/MergeConfig;

    invoke-direct {v1}, Lorg/eclipse/jgit/merge/MergeConfig;-><init>()V

    goto :goto_0
.end method

.method private static getFastForwardMode(Lorg/eclipse/jgit/lib/Config;[Ljava/lang/String;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .locals 13
    .parameter "config"
    .parameter "mergeOptions"

    .prologue
    .line 131
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    move v4, v3

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v8, v0, v4

    .line 132
    .local v8, option:Ljava/lang/String;
    invoke-static {}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->values()[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    array-length v6, v1

    .local v6, len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    :goto_1
    if-ge v3, v6, :cond_1

    aget-object v7, v1, v3

    .line 133
    .local v7, mode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->matchConfigValue(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 139
    .end local v1           #arr$:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .end local v3           #i$:I
    .end local v6           #len$:I
    .end local v7           #mode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .end local v8           #option:Ljava/lang/String;
    :goto_2
    return-object v7

    .line 132
    .restart local v1       #arr$:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .restart local v3       #i$:I
    .restart local v6       #len$:I
    .restart local v7       #mode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .restart local v8       #option:Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 131
    .end local v7           #mode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    :cond_1
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_0

    .line 136
    .end local v1           #arr$:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .end local v6           #len$:I
    .end local v8           #option:Ljava/lang/String;
    :cond_2
    const-string v9, "merge"

    const/4 v10, 0x0

    const-string v11, "ff"

    sget-object v12, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->TRUE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-virtual {p0, v9, v10, v11, v12}, Lorg/eclipse/jgit/lib/Config;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-static {v9}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->valueOf(Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    move-result-object v2

    .local v2, ffmode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    move-object v7, v2

    .line 139
    goto :goto_2
.end method

.method private static getMergeOptions(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;)[Ljava/lang/String;
    .locals 3
    .parameter "branch"
    .parameter "config"

    .prologue
    .line 152
    const-string v1, "branch"

    const-string v2, "mergeoptions"

    invoke-virtual {p1, v1, p0, v2}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, mergeOptions:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 156
    const-string v1, "\\s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 158
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    goto :goto_0
.end method

.method public static final getParser(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Config$SectionParser;
    .locals 1
    .parameter "branch"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/merge/MergeConfig;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static isMergeConfigOptionSet(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .parameter "optionToLookFor"
    .parameter "mergeOptions"

    .prologue
    .line 144
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 145
    .local v3, option:Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 146
    const/4 v4, 0x1

    .line 148
    .end local v3           #option:Ljava/lang/String;
    :goto_1
    return v4

    .line 144
    .restart local v3       #option:Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v3           #option:Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getFastForwardMode()Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    return-object v0
.end method

.method public isCommit()Z
    .locals 1

    .prologue
    .line 126
    iget-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->commit:Z

    return v0
.end method

.method public isSquash()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeConfig;->squash:Z

    return v0
.end method
