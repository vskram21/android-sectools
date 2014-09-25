.class synthetic Lorg/eclipse/jgit/api/MergeCommand$1;
.super Ljava/lang/Object;
.source "MergeCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/MergeCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode$Merge:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 455
    invoke-static {}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->values()[Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_7

    :goto_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_6

    :goto_1
    :try_start_2
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_5

    :goto_2
    :try_start_3
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_4

    .line 188
    :goto_3
    invoke-static {}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->values()[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode$Merge:[I

    :try_start_4
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode$Merge:[I

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->FALSE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_3

    :goto_4
    :try_start_5
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode$Merge:[I

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_2

    .line 168
    :goto_5
    invoke-static {}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->values()[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode:[I

    :try_start_6
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode:[I

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_1

    :goto_6
    :try_start_7
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode:[I

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_0

    :goto_7
    return-void

    :catch_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    goto :goto_6

    .line 188
    :catch_2
    move-exception v0

    goto :goto_5

    :catch_3
    move-exception v0

    goto :goto_4

    .line 455
    :catch_4
    move-exception v0

    goto :goto_3

    :catch_5
    move-exception v0

    goto :goto_2

    :catch_6
    move-exception v0

    goto :goto_1

    :catch_7
    move-exception v0

    goto :goto_0
.end method
