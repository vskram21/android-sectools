.class public Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;
.super Ljava/lang/Object;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BaseReceivePack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReceiveConfig"
.end annotation


# static fields
.field static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final allowCreates:Z

.field final allowDeletes:Z

.field final allowLeadingZeroFileMode:Z

.field final allowNonFastForwards:Z

.field final allowOfsDelta:Z

.field final checkReceivedObjects:Z

.field final safeForMacOS:Z

.field final safeForWindows:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 270
    new-instance v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 6
    .parameter "config"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 286
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 287
    const-string v0, "receive"

    const-string v3, "fsckobjects"

    const-string v4, "transfer"

    const-string v5, "fsckobjects"

    invoke-virtual {p1, v4, v5, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {p1, v0, v3, v4}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->checkReceivedObjects:Z

    .line 290
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->checkReceivedObjects:Z

    if-eqz v0, :cond_1

    const-string v0, "fsck"

    const-string v3, "allowLeadingZeroFileMode"

    invoke-virtual {p1, v0, v3, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowLeadingZeroFileMode:Z

    .line 292
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->checkReceivedObjects:Z

    if-eqz v0, :cond_2

    const-string v0, "fsck"

    const-string v3, "safeForWindows"

    invoke-virtual {p1, v0, v3, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->safeForWindows:Z

    .line 294
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->checkReceivedObjects:Z

    if-eqz v0, :cond_3

    const-string v0, "fsck"

    const-string v3, "safeForMacOS"

    invoke-virtual {p1, v0, v3, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->safeForMacOS:Z

    .line 297
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowCreates:Z

    .line 298
    const-string v0, "receive"

    const-string v3, "denydeletes"

    invoke-virtual {p1, v0, v3, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_4

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowDeletes:Z

    .line 299
    const-string v0, "receive"

    const-string v3, "denynonfastforwards"

    invoke-virtual {p1, v0, v3, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    move v2, v1

    :cond_0
    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowNonFastForwards:Z

    .line 301
    const-string v0, "repack"

    const-string v2, "usedeltabaseoffset"

    invoke-virtual {p1, v0, v2, v1}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowOfsDelta:Z

    .line 303
    return-void

    :cond_1
    move v0, v2

    .line 290
    goto :goto_0

    :cond_2
    move v0, v2

    .line 292
    goto :goto_1

    :cond_3
    move v0, v2

    .line 294
    goto :goto_2

    :cond_4
    move v0, v2

    .line 298
    goto :goto_3
.end method


# virtual methods
.method newObjectChecker()Lorg/eclipse/jgit/lib/ObjectChecker;
    .locals 2

    .prologue
    .line 306
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->checkReceivedObjects:Z

    if-nez v0, :cond_0

    .line 307
    const/4 v0, 0x0

    .line 308
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowLeadingZeroFileMode:Z

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectChecker;->setAllowLeadingZeroFileMode(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v0

    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->safeForWindows:Z

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForWindows(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v0

    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->safeForMacOS:Z

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForMacOS(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v0

    goto :goto_0
.end method
