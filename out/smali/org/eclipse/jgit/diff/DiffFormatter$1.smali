.class synthetic Lorg/eclipse/jgit/diff/DiffFormatter$1;
.super Ljava/lang/Object;
.source "DiffFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

.field static final synthetic $SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 979
    invoke-static {}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->values()[Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_6

    :goto_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_5

    .line 939
    :goto_1
    invoke-static {}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->values()[Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    :try_start_2
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_4

    :goto_2
    :try_start_3
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :goto_3
    :try_start_4
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_2

    :goto_4
    :try_start_5
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_1

    :goto_5
    :try_start_6
    sget-object v0, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_0

    :goto_6
    return-void

    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    goto :goto_4

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    goto :goto_2

    .line 979
    :catch_5
    move-exception v0

    goto :goto_1

    :catch_6
    move-exception v0

    goto :goto_0
.end method
