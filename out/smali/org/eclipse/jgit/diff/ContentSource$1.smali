.class synthetic Lorg/eclipse/jgit/diff/ContentSource$1;
.super Ljava/lang/Object;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/ContentSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 247
    invoke-static {}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->values()[Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/diff/ContentSource$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/diff/ContentSource$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/diff/ContentSource$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
