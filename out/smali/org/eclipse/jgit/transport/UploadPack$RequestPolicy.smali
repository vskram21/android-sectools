.class public final enum Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
.super Ljava/lang/Enum;
.source "UploadPack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/UploadPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestPolicy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

.field public static final enum ADVERTISED:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

.field public static final enum ANY:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

.field public static final enum REACHABLE_COMMIT:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

.field public static final enum REACHABLE_COMMIT_TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

.field public static final enum TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 109
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    const-string v1, "ADVERTISED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ADVERTISED:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 115
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    const-string v1, "REACHABLE_COMMIT"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 125
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    const-string v1, "TIP"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 133
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    const-string v1, "REACHABLE_COMMIT_TIP"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT_TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 136
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    const-string v1, "ANY"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ANY:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 107
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ADVERTISED:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT_TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ANY:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->$VALUES:[Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
    .locals 1
    .parameter "name"

    .prologue
    .line 107
    const-class v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
    .locals 1

    .prologue
    .line 107
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->$VALUES:[Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    return-object v0
.end method
