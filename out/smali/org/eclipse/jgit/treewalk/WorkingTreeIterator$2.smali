.class synthetic Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;
.super Ljava/lang/Object;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 838
    invoke-static {}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->values()[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_TIMESTAMP:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->SMUDGED:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_1
    :try_start_2
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_2
    :try_start_3
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    .line 586
    :goto_3
    invoke-static {}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->values()[Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

    :try_start_4
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    invoke-virtual {v1}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_4
    :try_start_5
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->NOT_IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    invoke-virtual {v1}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_5
    :try_start_6
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    invoke-virtual {v1}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    .line 393
    :goto_6
    invoke-static {}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->values()[Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    :try_start_7
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_7
    :try_start_8
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_8
    :try_start_9
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->INPUT:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_9
    return-void

    :catch_0
    move-exception v0

    goto :goto_9

    :catch_1
    move-exception v0

    goto :goto_8

    :catch_2
    move-exception v0

    goto :goto_7

    .line 586
    :catch_3
    move-exception v0

    goto :goto_6

    :catch_4
    move-exception v0

    goto :goto_5

    :catch_5
    move-exception v0

    goto :goto_4

    .line 838
    :catch_6
    move-exception v0

    goto :goto_3

    :catch_7
    move-exception v0

    goto :goto_2

    :catch_8
    move-exception v0

    goto :goto_1

    :catch_9
    move-exception v0

    goto/16 :goto_0
.end method
