.class Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
.super Ljava/lang/Object;
.source "BasePackFetchConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FetchConfig"
.end annotation


# static fields
.field static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final allowOfsDelta:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 275
    new-instance v0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "c"

    .prologue
    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    const-string v0, "repack"

    const-string v1, "usedeltabaseoffset"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;->allowOfsDelta:Z

    .line 285
    return-void
.end method
