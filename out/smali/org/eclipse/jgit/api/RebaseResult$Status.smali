.class public abstract enum Lorg/eclipse/jgit/api/RebaseResult$Status;
.super Ljava/lang/Enum;
.source "RebaseResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/RebaseResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/RebaseResult$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum ABORTED:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum EDIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum FAILED:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum FAST_FORWARD:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum INTERACTIVE_PREPARED:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum NOTHING_TO_COMMIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum OK:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum STASH_APPLY_CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum UNCOMMITTED_CHANGES:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field public static final enum UP_TO_DATE:Lorg/eclipse/jgit/api/RebaseResult$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 63
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$1;

    const-string v1, "OK"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/RebaseResult$Status$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->OK:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 72
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$2;

    const-string v1, "ABORTED"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/RebaseResult$Status$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->ABORTED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$3;

    const-string v1, "STOPPED"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/api/RebaseResult$Status$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 92
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$4;

    const-string v1, "EDIT"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/RebaseResult$Status$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->EDIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 101
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$5;

    const-string v1, "FAILED"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/RebaseResult$Status$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAILED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 113
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$6;

    const-string v1, "UNCOMMITTED_CHANGES"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->UNCOMMITTED_CHANGES:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 122
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$7;

    const-string v1, "CONFLICTS"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 131
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$8;

    const-string v1, "UP_TO_DATE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->UP_TO_DATE:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 140
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$9;

    const-string v1, "FAST_FORWARD"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAST_FORWARD:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 152
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$10;

    const-string v1, "NOTHING_TO_COMMIT"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->NOTHING_TO_COMMIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 163
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$11;

    const-string v1, "INTERACTIVE_PREPARED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->INTERACTIVE_PREPARED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 175
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult$Status$12;

    const-string v1, "STASH_APPLY_CONFLICTS"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseResult$Status$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->STASH_APPLY_CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 59
    const/16 v0, 0xc

    new-array v0, v0, [Lorg/eclipse/jgit/api/RebaseResult$Status;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->OK:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->ABORTED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->EDIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAILED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->UNCOMMITTED_CHANGES:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->UP_TO_DATE:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAST_FORWARD:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->NOTHING_TO_COMMIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->INTERACTIVE_PREPARED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->STASH_APPLY_CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->$VALUES:[Lorg/eclipse/jgit/api/RebaseResult$Status;

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
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/eclipse/jgit/api/RebaseResult$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/RebaseResult$Status;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/RebaseResult$Status;
    .locals 1
    .parameter "name"

    .prologue
    .line 59
    const-class v0, Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/RebaseResult$Status;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/RebaseResult$Status;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->$VALUES:[Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/RebaseResult$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/RebaseResult$Status;

    return-object v0
.end method


# virtual methods
.method public abstract isSuccessful()Z
.end method
