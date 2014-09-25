.class public final enum Lorg/eclipse/jgit/lib/Ref$Storage;
.super Ljava/lang/Enum;
.source "Ref.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/Ref;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Storage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/Ref$Storage;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/Ref$Storage;

.field public static final enum LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

.field public static final enum LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

.field public static final enum NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

.field public static final enum NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

.field public static final enum PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;


# instance fields
.field private final loose:Z

.field private final packed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v2, v3, v2}, Lorg/eclipse/jgit/lib/Ref$Storage;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 73
    new-instance v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v1, "LOOSE"

    invoke-direct {v0, v1, v3, v3, v2}, Lorg/eclipse/jgit/lib/Ref$Storage;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v1, "PACKED"

    invoke-direct {v0, v1, v4, v2, v3}, Lorg/eclipse/jgit/lib/Ref$Storage;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 89
    new-instance v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v1, "LOOSE_PACKED"

    invoke-direct {v0, v1, v5, v3, v3}, Lorg/eclipse/jgit/lib/Ref$Storage;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 98
    new-instance v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v1, "NETWORK"

    invoke-direct {v0, v1, v6, v2, v2}, Lorg/eclipse/jgit/lib/Ref$Storage;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 60
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/lib/Ref$Storage;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->$VALUES:[Lorg/eclipse/jgit/lib/Ref$Storage;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .locals 0
    .parameter
    .parameter
    .parameter "l"
    .parameter "p"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .prologue
    .line 104
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 105
    iput-boolean p3, p0, Lorg/eclipse/jgit/lib/Ref$Storage;->loose:Z

    .line 106
    iput-boolean p4, p0, Lorg/eclipse/jgit/lib/Ref$Storage;->packed:Z

    .line 107
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 1
    .parameter "name"

    .prologue
    .line 60
    const-class v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref$Storage;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->$VALUES:[Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/Ref$Storage;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/Ref$Storage;

    return-object v0
.end method


# virtual methods
.method public isLoose()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/Ref$Storage;->loose:Z

    return v0
.end method

.method public isPacked()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/Ref$Storage;->packed:Z

    return v0
.end method
