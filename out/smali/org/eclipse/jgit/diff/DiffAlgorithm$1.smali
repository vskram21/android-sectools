.class synthetic Lorg/eclipse/jgit/diff/DiffAlgorithm$1;
.super Ljava/lang/Object;
.source "DiffAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffAlgorithm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$diff$DiffAlgorithm$SupportedAlgorithm:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 111
    invoke-static {}, Lorg/eclipse/jgit/diff/Edit$Type;->values()[Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->DELETE:Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_1
    :try_start_2
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->REPLACE:Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_2
    :try_start_3
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    .line 78
    :goto_3
    invoke-static {}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->values()[Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$DiffAlgorithm$SupportedAlgorithm:[I

    :try_start_4
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$DiffAlgorithm$SupportedAlgorithm:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->MYERS:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_4
    :try_start_5
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$DiffAlgorithm$SupportedAlgorithm:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_5
    return-void

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_4

    .line 111
    :catch_2
    move-exception v0

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_2

    :catch_4
    move-exception v0

    goto :goto_1

    :catch_5
    move-exception v0

    goto :goto_0
.end method
