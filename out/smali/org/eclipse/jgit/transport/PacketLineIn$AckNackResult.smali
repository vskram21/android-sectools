.class final enum Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
.super Ljava/lang/Enum;
.source "PacketLineIn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PacketLineIn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "AckNackResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

.field public static final enum ACK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

.field public static final enum ACK_COMMON:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

.field public static final enum ACK_CONTINUE:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

.field public static final enum ACK_READY:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

.field public static final enum NAK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 75
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    const-string v1, "NAK"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->NAK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 77
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    const-string v1, "ACK"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    const-string v1, "ACK_CONTINUE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_CONTINUE:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    const-string v1, "ACK_COMMON"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_COMMON:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 83
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    const-string v1, "ACK_READY"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_READY:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 73
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->NAK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_CONTINUE:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_COMMON:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_READY:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->$VALUES:[Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

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
    .line 73
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 73
    const-class v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->$VALUES:[Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    return-object v0
.end method
