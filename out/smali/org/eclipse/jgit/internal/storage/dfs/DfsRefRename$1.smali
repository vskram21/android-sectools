.class synthetic Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename$1;
.super Ljava/lang/Object;
.source "DfsRefRename.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 65
    invoke-static {}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->values()[Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
