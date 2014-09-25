.class public final enum Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
.super Ljava/lang/Enum;
.source "RemoteRefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/RemoteRefUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum AWAITING_REPORT:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum NON_EXISTING:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum REJECTED_NODELETE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum REJECTED_REMOTE_CHANGED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field public static final enum UP_TO_DATE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 79
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "NOT_ATTEMPTED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 84
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "UP_TO_DATE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->UP_TO_DATE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 90
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "REJECTED_NONFASTFORWARD"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 96
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "REJECTED_NODELETE"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NODELETE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 102
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "REJECTED_REMOTE_CHANGED"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_REMOTE_CHANGED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 108
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "REJECTED_OTHER_REASON"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 114
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "NON_EXISTING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NON_EXISTING:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 120
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "AWAITING_REPORT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->AWAITING_REPORT:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 125
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    const-string v1, "OK"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 74
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->UP_TO_DATE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NODELETE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_REMOTE_CHANGED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NON_EXISTING:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->AWAITING_REPORT:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->$VALUES:[Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

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
    .line 74
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    .locals 1
    .parameter "name"

    .prologue
    .line 74
    const-class v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->$VALUES:[Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    return-object v0
.end method
