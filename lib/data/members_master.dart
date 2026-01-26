// lib/data/members_master.dart

class Character {
  final String id;
  final String team;
  final String role;
  final String name;

  /// 一覧表示用画像（RoleMemberGridPage）
  final String? image;

  /// 進化前画像（member_image_page）
  final String? normalImage;

  /// 進化後画像（member_image_page）
  final String? evolvedImage;

  late final int rarity; // ★1～★7
  late final int power;

  Character({
    required this.id,
    required this.team,
    required this.role,
    required this.name,
    this.image,
    this.normalImage,
    this.evolvedImage,
  }) {
    // role からレアリティを抽出（最初の文字が★）
    final match = RegExp(r'★(\d)').firstMatch(role);
    rarity = match != null ? int.parse(match.group(1)!) : 1;

    // レアリティに応じて戦闘力を自動計算
    power = _calculatePower(rarity);
  }

  int _calculatePower(int rarity) {
    switch (rarity) {
      case 1:
        return 100;
      case 2:
        return 200;
      case 3:
        return 400;
      case 4:
        return 800;
      case 5:
        return 1500;
      case 6:
        return 2500;
      case 7:
        return 4000;
      default:
        return 100;
    }
  }
}


// =========================
// マスターデータ（Character 型統一）
// =========================
final List<Character> membersMaster = [
// =========================
// Obsidian Knights
// =========================
Character(id:'OK-001', team:'Obsidian Knights', role:'★7 Grand Commander', name:'Leona', image:'assets/cards1/obsidianknights1/1.webp', normalImage:'assets/cards2/obsidianknights2/1.webp', evolvedImage:'assets/cards3/obsidianknights3/1.webp'),
Character(id:'OK-002', team:'Obsidian Knights', role:'★6 Vice Commander', name:'Helga', image:'assets/cards1/obsidianknights1/2.webp', normalImage:'assets/cards2/obsidianknights2/2.webp', evolvedImage:'assets/cards3/obsidianknights3/2.webp'),
Character(id:'OK-003', team:'Obsidian Knights', role:'★6 High Strategist', name:'Magna', image:'assets/cards1/obsidianknights1/3.webp', normalImage:'assets/cards2/obsidianknights2/3.webp', evolvedImage:'assets/cards3/obsidianknights3/3.webp'),
Character(id:'OK-004', team:'Obsidian Knights', role:'★5 Master of Intelligence', name:'Iris', image:'assets/cards1/obsidianknights1/4.webp', normalImage:'assets/cards2/obsidianknights2/4.webp', evolvedImage:'assets/cards3/obsidianknights3/4.webp'),
Character(id:'OK-005', team:'Obsidian Knights', role:'★5 Quartermaster General', name:'Terra', image:'assets/cards1/obsidianknights1/5.webp', normalImage:'assets/cards2/obsidianknights2/5.webp', evolvedImage:'assets/cards3/obsidianknights3/5.webp'),
Character(id:'OK-006', team:'Obsidian Knights', role:'★5 High Executioners', name:'Karen', image:'assets/cards1/obsidianknights1/6.webp', normalImage:'assets/cards2/obsidianknights2/6.webp', evolvedImage:'assets/cards3/obsidianknights3/6.webp'),
Character(id:'OK-007', team:'Obsidian Knights', role:'★5 High Executioners', name:'Zara', image:'assets/cards1/obsidianknights1/7.webp', normalImage:'assets/cards2/obsidianknights2/7.webp', evolvedImage:'assets/cards3/obsidianknights3/7.webp'),
Character(id:'OK-008', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Daria', image:'assets/cards1/obsidianknights1/8.webp', normalImage:'assets/cards2/obsidianknights2/8.webp', evolvedImage:'assets/cards3/obsidianknights3/8.webp'),
Character(id:'OK-009', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Ragna', image:'assets/cards1/obsidianknights1/9.webp', normalImage:'assets/cards2/obsidianknights2/9.webp', evolvedImage:'assets/cards3/obsidianknights3/9.webp'),
Character(id:'OK-010', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Agnes', image:'assets/cards1/obsidianknights1/10.webp', normalImage:'assets/cards2/obsidianknights2/10.webp', evolvedImage:'assets/cards3/obsidianknights3/10.webp'),
Character(id:'OK-011', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Gray', image:'assets/cards1/obsidianknights1/11.webp', normalImage:'assets/cards2/obsidianknights2/11.webp', evolvedImage:'assets/cards3/obsidianknights3/11.webp'),
Character(id:'OK-012', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Nero', image:'assets/cards1/obsidianknights1/12.webp', normalImage:'assets/cards2/obsidianknights2/12.webp', evolvedImage:'assets/cards3/obsidianknights3/12.webp'),
Character(id:'OK-013', team:'Obsidian Knights', role:'★4 Knight Captains', name:'Corvin', image:'assets/cards1/obsidianknights1/13.webp', normalImage:'assets/cards2/obsidianknights2/13.webp', evolvedImage:'assets/cards3/obsidianknights3/13.webp'),
Character(id:'OK-014', team:'Obsidian Knights', role:'★3 Obsidian Guard', name:'Van', image:'assets/cards1/obsidianknights1/14.webp', normalImage:'assets/cards2/obsidianknights2/14.webp', evolvedImage:'assets/cards3/obsidianknights3/14.webp'),
Character(id:'OK-015', team:'Obsidian Knights', role:'★3 Obsidian Guard', name:'Kill', image:'assets/cards1/obsidianknights1/15.webp', normalImage:'assets/cards2/obsidianknights2/15.webp', evolvedImage:'assets/cards3/obsidianknights3/15.webp'),
Character(id:'OK-016', team:'Obsidian Knights', role:'★3 Obsidian Guard', name:'Mord', image:'assets/cards1/obsidianknights1/16.webp', normalImage:'assets/cards2/obsidianknights2/16.webp', evolvedImage:'assets/cards3/obsidianknights3/16.webp'),
Character(id:'OK-017', team:'Obsidian Knights', role:'★3 Obsidian Guard', name:'Gardo', image:'assets/cards1/obsidianknights1/17.webp', normalImage:'assets/cards2/obsidianknights2/17.webp', evolvedImage:'assets/cards3/obsidianknights3/17.webp'),
Character(id:'OK-018', team:'Obsidian Knights', role:'★3 Vanguard Breakers', name:'Bram', image:'assets/cards1/obsidianknights1/18.webp', normalImage:'assets/cards2/obsidianknights2/18.webp', evolvedImage:'assets/cards3/obsidianknights3/18.webp'),
Character(id:'OK-019', team:'Obsidian Knights', role:'★3 Vanguard Breakers', name:'Bald', image:'assets/cards1/obsidianknights1/19.webp', normalImage:'assets/cards2/obsidianknights2/19.webp', evolvedImage:'assets/cards3/obsidianknights3/19.webp'),
Character(id:'OK-020', team:'Obsidian Knights', role:'★3 Vanguard Breakers', name:'Mach', image:'assets/cards1/obsidianknights1/20.webp', normalImage:'assets/cards2/obsidianknights2/20.webp', evolvedImage:'assets/cards3/obsidianknights3/20.webp'),
Character(id:'OK-021', team:'Obsidian Knights', role:'★3 Vanguard Breakers', name:'Rusk', image:'assets/cards1/obsidianknights1/21.webp', normalImage:'assets/cards2/obsidianknights2/21.webp', evolvedImage:'assets/cards3/obsidianknights3/21.webp'),
Character(id:'OK-022', team:'Obsidian Knights', role:'★3 Vanguard Breakers', name:'Dolka', image:'assets/cards1/obsidianknights1/22.webp', normalImage:'assets/cards2/obsidianknights2/22.webp', evolvedImage:'assets/cards3/obsidianknights3/22.webp'),
Character(id:'OK-023', team:'Obsidian Knights', role:'★3 Shadow Lancers', name:'Frey', image:'assets/cards1/obsidianknights1/23.webp', normalImage:'assets/cards2/obsidianknights2/23.webp', evolvedImage:'assets/cards3/obsidianknights3/23.webp'),
Character(id:'OK-024', team:'Obsidian Knights', role:'★3 Shadow Lancers', name:'Sigur', image:'assets/cards1/obsidianknights1/24.webp', normalImage:'assets/cards2/obsidianknights2/24.webp', evolvedImage:'assets/cards3/obsidianknights3/24.webp'),
Character(id:'OK-025', team:'Obsidian Knights', role:'★3 Shadow Lancers', name:'Zena', image:'assets/cards1/obsidianknights1/25.webp', normalImage:'assets/cards2/obsidianknights2/25.webp', evolvedImage:'assets/cards3/obsidianknights3/25.webp'),
Character(id:'OK-026', team:'Obsidian Knights', role:'★3 Shadow Lancers', name:'Sui', image:'assets/cards1/obsidianknights1/26.webp', normalImage:'assets/cards2/obsidianknights2/26.webp', evolvedImage:'assets/cards3/obsidianknights3/26.webp'),
Character(id:'OK-027', team:'Obsidian Knights', role:'★2 Executioners', name:'Olga', image:'assets/cards1/obsidianknights1/27.webp', normalImage:'assets/cards2/obsidianknights2/27.webp', evolvedImage:'assets/cards3/obsidianknights3/27.webp'),
Character(id:'OK-028', team:'Obsidian Knights', role:'★2 Executioners', name:'Fel', image:'assets/cards1/obsidianknights1/28.webp', normalImage:'assets/cards2/obsidianknights2/28.webp', evolvedImage:'assets/cards3/obsidianknights3/28.webp'),
Character(id:'OK-029', team:'Obsidian Knights', role:'★2 Executioners', name:'Mia', image:'assets/cards1/obsidianknights1/29.webp', normalImage:'assets/cards2/obsidianknights2/29.webp', evolvedImage:'assets/cards3/obsidianknights3/29.webp'),
Character(id:'OK-030', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Yumi', image:'assets/cards1/obsidianknights1/30.webp', normalImage:'assets/cards2/obsidianknights2/30.webp', evolvedImage:'assets/cards3/obsidianknights3/30.webp'),
Character(id:'OK-031', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Lotta', image:'assets/cards1/obsidianknights1/31.webp', normalImage:'assets/cards2/obsidianknights2/31.webp', evolvedImage:'assets/cards3/obsidianknights3/31.webp'),
Character(id:'OK-032', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Mel', image:'assets/cards1/obsidianknights1/32.webp', normalImage:'assets/cards2/obsidianknights2/32.webp', evolvedImage:'assets/cards3/obsidianknights3/32.webp'),
Character(id:'OK-033', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Alma', image:'assets/cards1/obsidianknights1/33.webp', normalImage:'assets/cards2/obsidianknights2/33.webp', evolvedImage:'assets/cards3/obsidianknights3/33.webp'),
Character(id:'OK-034', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Elma', image:'assets/cards1/obsidianknights1/34.webp', normalImage:'assets/cards2/obsidianknights2/34.webp', evolvedImage:'assets/cards3/obsidianknights3/34.webp'),
Character(id:'OK-035', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Eda', image:'assets/cards1/obsidianknights1/35.webp', normalImage:'assets/cards2/obsidianknights2/35.webp', evolvedImage:'assets/cards3/obsidianknights3/35.webp'),
Character(id:'OK-036', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Io', image:'assets/cards1/obsidianknights1/36.webp', normalImage:'assets/cards2/obsidianknights2/36.webp', evolvedImage:'assets/cards3/obsidianknights3/36.webp'),
Character(id:'OK-037', team:'Obsidian Knights', role:'★2 Veteran Knights', name:'Rynn', image:'assets/cards1/obsidianknights1/37.webp', normalImage:'assets/cards2/obsidianknights2/37.webp', evolvedImage:'assets/cards3/obsidianknights3/37.webp'),
Character(id:'OK-038', team:'Obsidian Knights', role:'★1 Arc Support Unit', name:'Haru', image:'assets/cards1/obsidianknights1/38.webp', normalImage:'assets/cards2/obsidianknights2/38.webp', evolvedImage:'assets/cards3/obsidianknights3/38.webp'),
Character(id:'OK-039', team:'Obsidian Knights', role:'★1 Arc Support Unit', name:'Mir', image:'assets/cards1/obsidianknights1/39.webp', normalImage:'assets/cards2/obsidianknights2/39.webp', evolvedImage:'assets/cards3/obsidianknights3/39.webp'),
Character(id:'OK-040', team:'Obsidian Knights', role:'★1 Arc Support Unit', name:'Sen', image:'assets/cards1/obsidianknights1/40.webp', normalImage:'assets/cards2/obsidianknights2/40.webp', evolvedImage:'assets/cards3/obsidianknights3/40.webp'),
Character(id:'OK-041', team:'Obsidian Knights', role:'★1 Arc Support Unit', name:'Nova', image:'assets/cards1/obsidianknights1/41.webp', normalImage:'assets/cards2/obsidianknights2/41.webp', evolvedImage:'assets/cards3/obsidianknights3/41.webp'),
Character(id:'OK-042', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Karl', image:'assets/cards1/obsidianknights1/42.webp', normalImage:'assets/cards2/obsidianknights2/42.webp', evolvedImage:'assets/cards3/obsidianknights3/42.webp'),
Character(id:'OK-043', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Quinn', image:'assets/cards1/obsidianknights1/43.webp', normalImage:'assets/cards2/obsidianknights2/43.webp', evolvedImage:'assets/cards3/obsidianknights3/43.webp'),
Character(id:'OK-044', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Fam', image:'assets/cards1/obsidianknights1/44.webp', normalImage:'assets/cards2/obsidianknights2/44.webp', evolvedImage:'assets/cards3/obsidianknights3/44.webp'),
Character(id:'OK-045', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Row', image:'assets/cards1/obsidianknights1/45.webp', normalImage:'assets/cards2/obsidianknights2/45.webp', evolvedImage:'assets/cards3/obsidianknights3/45.webp'),
Character(id:'OK-046', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Knight', image:'assets/cards1/obsidianknights1/46.webp', normalImage:'assets/cards2/obsidianknights2/46.webp', evolvedImage:'assets/cards3/obsidianknights3/46.webp'),
Character(id:'OK-047', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Zyra', image:'assets/cards1/obsidianknights1/47.webp', normalImage:'assets/cards2/obsidianknights2/47.webp', evolvedImage:'assets/cards3/obsidianknights3/47.webp'),
Character(id:'OK-048', team:'Obsidian Knights', role:'★1 Initiate Knights', name:'Scarlet', image:'assets/cards1/obsidianknights1/48.webp', normalImage:'assets/cards2/obsidianknights2/48.webp', evolvedImage:'assets/cards3/obsidianknights3/48.webp'),

// =========================
// Yellow Skulls
// =========================
Character(id:'YS-001', team:'Yellow Skulls', role:'★7 Skull Queen', name:'Chaos', image:'assets/cards1/yellowskulls1/1.webp', normalImage:'assets/cards2/yellowskulls2/1.webp', evolvedImage:'assets/cards3/yellowskulls3/1.webp'),
Character(id:'YS-002', team:'Yellow Skulls', role:'★6 Laughing Tyrant', name:'Crash', image:'assets/cards1/yellowskulls1/2.webp', normalImage:'assets/cards2/yellowskulls2/2.webp', evolvedImage:'assets/cards3/yellowskulls3/2.webp'),
Character(id:'YS-003', team:'Yellow Skulls', role:'★6 Master of Mayhem', name:'Blitz', image:'assets/cards1/yellowskulls1/3.webp', normalImage:'assets/cards2/yellowskulls2/3.webp', evolvedImage:'assets/cards3/yellowskulls3/3.webp'),
Character(id:'YS-004', team:'Yellow Skulls', role:'★5 Bone Engineer', name:'Gear', image:'assets/cards1/yellowskulls1/4.webp', normalImage:'assets/cards2/yellowskulls2/4.webp', evolvedImage:'assets/cards3/yellowskulls3/4.webp'),
Character(id:'YS-005', team:'Yellow Skulls', role:'★5 Riot Caller', name:'Noise', image:'assets/cards1/yellowskulls1/5.webp', normalImage:'assets/cards2/yellowskulls2/5.webp', evolvedImage:'assets/cards3/yellowskulls3/5.webp'),
Character(id:'YS-006', team:'Yellow Skulls', role:'★5 Cruel Skull Captains', name:'Ban', image:'assets/cards1/yellowskulls1/6.webp', normalImage:'assets/cards2/yellowskulls2/6.webp', evolvedImage:'assets/cards3/yellowskulls3/6.webp'),
Character(id:'YS-007', team:'Yellow Skulls', role:'★5 Cruel Skull Captains', name:'Jack', image:'assets/cards1/yellowskulls1/7.webp', normalImage:'assets/cards2/yellowskulls2/7.webp', evolvedImage:'assets/cards3/yellowskulls3/7.webp'),
Character(id:'YS-008', team:'Yellow Skulls', role:'★4 Skull Captains', name:'Punk', image:'assets/cards1/yellowskulls1/8.webp', normalImage:'assets/cards2/yellowskulls2/8.webp', evolvedImage:'assets/cards3/yellowskulls3/8.webp'),
Character(id:'YS-009', team:'Yellow Skulls', role:'★4 Skull Captains', name:'Bomber', image:'assets/cards1/yellowskulls1/9.webp', normalImage:'assets/cards2/yellowskulls2/9.webp', evolvedImage:'assets/cards3/yellowskulls3/9.webp'),
Character(id:'YS-010', team:'Yellow Skulls', role:'★4 Skull Captains', name:'Turbo', image:'assets/cards1/yellowskulls1/10.webp', normalImage:'assets/cards2/yellowskulls2/10.webp', evolvedImage:'assets/cards3/yellowskulls3/10.webp'),
Character(id:'YS-011', team:'Yellow Skulls', role:'★4 Skull Captains', name:'Skull', image:'assets/cards1/yellowskulls1/11.webp', normalImage:'assets/cards2/yellowskulls2/11.webp', evolvedImage:'assets/cards3/yellowskulls3/11.webp'),
Character(id:'YS-012', team:'Yellow Skulls', role:'★4 Mad Drivers', name:'Spark', image:'assets/cards1/yellowskulls1/12.webp', normalImage:'assets/cards2/yellowskulls2/12.webp', evolvedImage:'assets/cards3/yellowskulls3/12.webp'),
Character(id:'YS-013', team:'Yellow Skulls', role:'★4 Mad Drivers', name:'Thunder', image:'assets/cards1/yellowskulls1/13.webp', normalImage:'assets/cards2/yellowskulls2/13.webp', evolvedImage:'assets/cards3/yellowskulls3/13.webp'),
Character(id:'YS-014', team:'Yellow Skulls', role:'★4 Mad Drivers', name:'Comet', image:'assets/cards1/yellowskulls1/14.webp', normalImage:'assets/cards2/yellowskulls2/14.webp', evolvedImage:'assets/cards3/yellowskulls3/14.webp'),
Character(id:'YS-015', team:'Yellow Skulls', role:'★4 Mad Drivers', name:'Flash', image:'assets/cards1/yellowskulls1/15.webp', normalImage:'assets/cards2/yellowskulls2/15.webp', evolvedImage:'assets/cards3/yellowskulls3/15.webp'),
Character(id:'YS-016', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Cherry', image:'assets/cards1/yellowskulls1/16.webp', normalImage:'assets/cards2/yellowskulls2/16.webp', evolvedImage:'assets/cards3/yellowskulls3/16.webp'),
Character(id:'YS-017', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Candy', image:'assets/cards1/yellowskulls1/17.webp', normalImage:'assets/cards2/yellowskulls2/17.webp', evolvedImage:'assets/cards3/yellowskulls3/17.webp'),
Character(id:'YS-018', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Vivi', image:'assets/cards1/yellowskulls1/18.webp', normalImage:'assets/cards2/yellowskulls2/18.webp', evolvedImage:'assets/cards3/yellowskulls3/18.webp'),
Character(id:'YS-019', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Bibi', image:'assets/cards1/yellowskulls1/19.webp', normalImage:'assets/cards2/yellowskulls2/19.webp', evolvedImage:'assets/cards3/yellowskulls3/19.webp'),
Character(id:'YS-020', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Mimi', image:'assets/cards1/yellowskulls1/20.webp', normalImage:'assets/cards2/yellowskulls2/20.webp', evolvedImage:'assets/cards3/yellowskulls3/20.webp'),
Character(id:'YS-021', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Kiki', image:'assets/cards1/yellowskulls1/21.webp', normalImage:'assets/cards2/yellowskulls2/21.webp', evolvedImage:'assets/cards3/yellowskulls3/21.webp'),
Character(id:'YS-022', team:'Yellow Skulls', role:'★3 Boom Sisters', name:'Yaya', image:'assets/cards1/yellowskulls1/22.webp', normalImage:'assets/cards2/yellowskulls2/22.webp', evolvedImage:'assets/cards3/yellowskulls3/22.webp'),
Character(id:'YS-023', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Roco', image:'assets/cards1/yellowskulls1/23.webp', normalImage:'assets/cards2/yellowskulls2/23.webp', evolvedImage:'assets/cards3/yellowskulls3/23.webp'),
Character(id:'YS-024', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Pin', image:'assets/cards1/yellowskulls1/24.webp', normalImage:'assets/cards2/yellowskulls2/24.webp', evolvedImage:'assets/cards3/yellowskulls3/24.webp'),
Character(id:'YS-025', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Pon', image:'assets/cards1/yellowskulls1/25.webp', normalImage:'assets/cards2/yellowskulls2/25.webp', evolvedImage:'assets/cards3/yellowskulls3/25.webp'),
Character(id:'YS-026', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Pal', image:'assets/cards1/yellowskulls1/26.webp', normalImage:'assets/cards2/yellowskulls2/26.webp', evolvedImage:'assets/cards3/yellowskulls3/26.webp'),
Character(id:'YS-027', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Zuzu', image:'assets/cards1/yellowskulls1/27.webp', normalImage:'assets/cards2/yellowskulls2/27.webp', evolvedImage:'assets/cards3/yellowskulls3/27.webp'),
Character(id:'YS-028', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Ram', image:'assets/cards1/yellowskulls1/28.webp', normalImage:'assets/cards2/yellowskulls2/28.webp', evolvedImage:'assets/cards3/yellowskulls3/28.webp'),
Character(id:'YS-029', team:'Yellow Skulls', role:'★3 Riot Dancers', name:'Mon', image:'assets/cards1/yellowskulls1/29.webp', normalImage:'assets/cards2/yellowskulls2/29.webp', evolvedImage:'assets/cards3/yellowskulls3/29.webp'),
Character(id:'YS-030', team:'Yellow Skulls', role:'★2 Skull Smashers', name:'Gum', image:'assets/cards1/yellowskulls1/30.webp', normalImage:'assets/cards2/yellowskulls2/30.webp', evolvedImage:'assets/cards3/yellowskulls3/30.webp'),
Character(id:'YS-031', team:'Yellow Skulls', role:'★2 Skull Smashers', name:'Bachi', image:'assets/cards1/yellowskulls1/31.webp', normalImage:'assets/cards2/yellowskulls2/31.webp', evolvedImage:'assets/cards3/yellowskulls3/31.webp'),
Character(id:'YS-032', team:'Yellow Skulls', role:'★2 Skull Smashers', name:'Garuru', image:'assets/cards1/yellowskulls1/32.webp', normalImage:'assets/cards2/yellowskulls2/32.webp', evolvedImage:'assets/cards3/yellowskulls3/32.webp'),
Character(id:'YS-033', team:'Yellow Skulls', role:'★2 Skull Smashers', name:'Doro', image:'assets/cards1/yellowskulls1/33.webp', normalImage:'assets/cards2/yellowskulls2/33.webp', evolvedImage:'assets/cards3/yellowskulls3/33.webp'),
Character(id:'YS-034', team:'Yellow Skulls', role:'★2 Loot Runners', name:'Chip', image:'assets/cards1/yellowskulls1/34.webp', normalImage:'assets/cards2/yellowskulls2/34.webp', evolvedImage:'assets/cards3/yellowskulls3/34.webp'),
Character(id:'YS-035', team:'Yellow Skulls', role:'★2 Loot Runners', name:'Pero', image:'assets/cards1/yellowskulls1/35.webp', normalImage:'assets/cards2/yellowskulls2/35.webp', evolvedImage:'assets/cards3/yellowskulls3/35.webp'),
Character(id:'YS-036', team:'Yellow Skulls', role:'★2 Loot Runners', name:'Deco', image:'assets/cards1/yellowskulls1/36.webp', normalImage:'assets/cards2/yellowskulls2/36.webp', evolvedImage:'assets/cards3/yellowskulls3/36.webp'),
Character(id:'YS-037', team:'Yellow Skulls', role:'★2 Loot Runners', name:'Rough', image:'assets/cards1/yellowskulls1/37.webp', normalImage:'assets/cards2/yellowskulls2/37.webp', evolvedImage:'assets/cards3/yellowskulls3/37.webp'),
Character(id:'YS-038', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Pico', image:'assets/cards1/yellowskulls1/38.webp', normalImage:'assets/cards2/yellowskulls2/38.webp', evolvedImage:'assets/cards3/yellowskulls3/38.webp'),
Character(id:'YS-039', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Tori', image:'assets/cards1/yellowskulls1/39.webp', normalImage:'assets/cards2/yellowskulls2/39.webp', evolvedImage:'assets/cards3/yellowskulls3/39.webp'),
Character(id:'YS-040', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Jin', image:'assets/cards1/yellowskulls1/40.webp', normalImage:'assets/cards2/yellowskulls2/40.webp', evolvedImage:'assets/cards3/yellowskulls3/40.webp'),
Character(id:'YS-041', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Yellow', image:'assets/cards1/yellowskulls1/41.webp', normalImage:'assets/cards2/yellowskulls2/41.webp', evolvedImage:'assets/cards3/yellowskulls3/41.webp'),
Character(id:'YS-042', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Nuts', image:'assets/cards1/yellowskulls1/42.webp', normalImage:'assets/cards2/yellowskulls2/42.webp', evolvedImage:'assets/cards3/yellowskulls3/42.webp'),
Character(id:'YS-043', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Kero', image:'assets/cards1/yellowskulls1/43.webp', normalImage:'assets/cards2/yellowskulls2/43.webp', evolvedImage:'assets/cards3/yellowskulls3/43.webp'),
Character(id:'YS-044', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Doruru', image:'assets/cards1/yellowskulls1/44.webp', normalImage:'assets/cards2/yellowskulls2/44.webp', evolvedImage:'assets/cards3/yellowskulls3/44.webp'),
Character(id:'YS-045', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Daisy', image:'assets/cards1/yellowskulls1/45.webp', normalImage:'assets/cards2/yellowskulls2/45.webp', evolvedImage:'assets/cards3/yellowskulls3/45.webp'),
Character(id:'YS-046', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Lexa', image:'assets/cards1/yellowskulls1/46.webp', normalImage:'assets/cards2/yellowskulls2/46.webp', evolvedImage:'assets/cards3/yellowskulls3/46.webp'),
Character(id:'YS-047', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Evelyn', image:'assets/cards1/yellowskulls1/47.webp', normalImage:'assets/cards2/yellowskulls2/47.webp', evolvedImage:'assets/cards3/yellowskulls3/47.webp'),
Character(id:'YS-048', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Madison', image:'assets/cards1/yellowskulls1/48.webp', normalImage:'assets/cards2/yellowskulls2/48.webp', evolvedImage:'assets/cards3/yellowskulls3/48.webp'),
Character(id:'YS-049', team:'Yellow Skulls', role:'★1 Fresh Skulls', name:'Elsie', image:'assets/cards1/yellowskulls1/49.webp', normalImage:'assets/cards2/yellowskulls2/49.webp', evolvedImage:'assets/cards3/yellowskulls3/49.webp'),

// =========================
// White Vine
// =========================
Character(id:'WV-001', team:'White Vine', role:'★7 Vine Mother', name:'Tsuki', image:'assets/cards1/whitevine1/1.webp', normalImage:'assets/cards2/whitevine2/1.webp', evolvedImage:'assets/cards3/whitevine3/1.webp'),
Character(id:'WV-002', team:'White Vine', role:'★6 Pale Regent', name:'Kasumi', image:'assets/cards1/whitevine1/2.webp', normalImage:'assets/cards2/whitevine2/2.webp', evolvedImage:'assets/cards3/whitevine3/2.webp'),
Character(id:'WV-003', team:'White Vine', role:'★6 Whisper Archivist', name:'Iroha', image:'assets/cards1/whitevine1/3.webp', normalImage:'assets/cards2/whitevine2/3.webp', evolvedImage:'assets/cards3/whitevine3/3.webp'),
Character(id:'WV-004', team:'White Vine', role:'★5 Venom Apothecary', name:'Chise', image:'assets/cards1/whitevine1/4.webp', normalImage:'assets/cards2/whitevine2/4.webp', evolvedImage:'assets/cards3/whitevine3/4.webp'),
Character(id:'WV-005', team:'White Vine', role:'★5 Veil Master', name:'Shirone', image:'assets/cards1/whitevine1/5.webp', normalImage:'assets/cards2/whitevine2/5.webp', evolvedImage:'assets/cards3/whitevine3/5.webp'),
Character(id:'WV-006', team:'White Vine', role:'★4 White Dew Scribes', name:'Yuki', image:'assets/cards1/whitevine1/6.webp', normalImage:'assets/cards2/whitevine2/6.webp', evolvedImage:'assets/cards3/whitevine3/6.webp'),
Character(id:'WV-007', team:'White Vine', role:'★4 White Dew Scribes', name:'Haku', image:'assets/cards1/whitevine1/7.webp', normalImage:'assets/cards2/whitevine2/7.webp', evolvedImage:'assets/cards3/whitevine3/7.webp'),
Character(id:'WV-008', team:'White Vine', role:'★4 Vine Wardens', name:'Nagi', image:'assets/cards1/whitevine1/8.webp', normalImage:'assets/cards2/whitevine2/8.webp', evolvedImage:'assets/cards3/whitevine3/8.webp'),
Character(id:'WV-009', team:'White Vine', role:'★4 Vine Wardens', name:'Suzu', image:'assets/cards1/whitevine1/9.webp', normalImage:'assets/cards2/whitevine2/9.webp', evolvedImage:'assets/cards3/whitevine3/9.webp'),
Character(id:'WV-010', team:'White Vine', role:'★4 Vine Wardens', name:'Haruka', image:'assets/cards1/whitevine1/10.webp', normalImage:'assets/cards2/whitevine2/10.webp', evolvedImage:'assets/cards3/whitevine3/10.webp'),
Character(id:'WV-011', team:'White Vine', role:'★4 Vine Wardens', name:'Setsuna', image:'assets/cards1/whitevine1/11.webp', normalImage:'assets/cards2/whitevine2/11.webp', evolvedImage:'assets/cards3/whitevine3/11.webp'),
Character(id:'WV-012', team:'White Vine', role:'★4 Vine Wardens', name:'Honoka', image:'assets/cards1/whitevine1/12.webp', normalImage:'assets/cards2/whitevine2/12.webp', evolvedImage:'assets/cards3/whitevine3/12.webp'),
Character(id:'WV-013', team:'White Vine', role:'★3 White Petals', name:'Kiri', image:'assets/cards1/whitevine1/13.webp', normalImage:'assets/cards2/whitevine2/13.webp', evolvedImage:'assets/cards3/whitevine3/13.webp'),
Character(id:'WV-014', team:'White Vine', role:'★3 White Petals', name:'Ito', image:'assets/cards1/whitevine1/14.webp', normalImage:'assets/cards2/whitevine2/14.webp', evolvedImage:'assets/cards3/whitevine3/14.webp'),
Character(id:'WV-015', team:'White Vine', role:'★3 White Petals', name:'Asa', image:'assets/cards1/whitevine1/15.webp', normalImage:'assets/cards2/whitevine2/15.webp', evolvedImage:'assets/cards3/whitevine3/15.webp'),
Character(id:'WV-016', team:'White Vine', role:'★3 White Petals', name:'Mitsumi', image:'assets/cards1/whitevine1/16.webp', normalImage:'assets/cards2/whitevine2/16.webp', evolvedImage:'assets/cards3/whitevine3/16.webp'),
Character(id:'WV-017', team:'White Vine', role:'★3 Root Runners', name:'Ichika', image:'assets/cards1/whitevine1/17.webp', normalImage:'assets/cards2/whitevine2/17.webp', evolvedImage:'assets/cards3/whitevine3/17.webp'),
Character(id:'WV-018', team:'White Vine', role:'★3 Root Runners', name:'Tsumugi', image:'assets/cards1/whitevine1/18.webp', normalImage:'assets/cards2/whitevine2/18.webp', evolvedImage:'assets/cards3/whitevine3/18.webp'),
Character(id:'WV-019', team:'White Vine', role:'★3 Root Runners', name:'Kana', image:'assets/cards1/whitevine1/19.webp', normalImage:'assets/cards2/whitevine2/19.webp', evolvedImage:'assets/cards3/whitevine3/19.webp'),
Character(id:'WV-020', team:'White Vine', role:'★3 Root Runners', name:'Nene', image:'assets/cards1/whitevine1/20.webp', normalImage:'assets/cards2/whitevine2/20.webp', evolvedImage:'assets/cards3/whitevine3/20.webp'),
Character(id:'WV-021', team:'White Vine', role:'★3 Root Runners', name:'Miyo', image:'assets/cards1/whitevine1/21.webp', normalImage:'assets/cards2/whitevine2/21.webp', evolvedImage:'assets/cards3/whitevine3/21.webp'),
Character(id:'WV-022', team:'White Vine', role:'★3 Root Runners', name:'Fumi', image:'assets/cards1/whitevine1/22.webp', normalImage:'assets/cards2/whitevine2/22.webp', evolvedImage:'assets/cards3/whitevine3/22.webp'),
Character(id:'WV-023', team:'White Vine', role:'★3 Root Runners', name:'Midori', image:'assets/cards1/whitevine1/23.webp', normalImage:'assets/cards2/whitevine2/23.webp', evolvedImage:'assets/cards3/whitevine3/23.webp'),
Character(id:'WV-024', team:'White Vine', role:'★2 Mirror Faces', name:'Momo', image:'assets/cards1/whitevine1/24.webp', normalImage:'assets/cards2/whitevine2/24.webp', evolvedImage:'assets/cards3/whitevine3/24.webp'),
Character(id:'WV-025', team:'White Vine', role:'★2 Mirror Faces', name:'Nono', image:'assets/cards1/whitevine1/25.webp', normalImage:'assets/cards2/whitevine2/25.webp', evolvedImage:'assets/cards3/whitevine3/25.webp'),
Character(id:'WV-026', team:'White Vine', role:'★2 Mirror Faces', name:'Hina', image:'assets/cards1/whitevine1/26.webp', normalImage:'assets/cards2/whitevine2/26.webp', evolvedImage:'assets/cards3/whitevine3/26.webp'),
Character(id:'WV-027', team:'White Vine', role:'★2 Mirror Faces', name:'Yuu', image:'assets/cards1/whitevine1/27.webp', normalImage:'assets/cards2/whitevine2/27.webp', evolvedImage:'assets/cards3/whitevine3/27.webp'),
Character(id:'WV-028', team:'White Vine', role:'★2 Mirror Faces', name:'Rei', image:'assets/cards1/whitevine1/28.webp', normalImage:'assets/cards2/whitevine2/28.webp', evolvedImage:'assets/cards3/whitevine3/28.webp'),
Character(id:'WV-029', team:'White Vine', role:'★2 Dew Scribes', name:'Sarasa', image:'assets/cards1/whitevine1/29.webp', normalImage:'assets/cards2/whitevine2/29.webp', evolvedImage:'assets/cards3/whitevine3/29.webp'),
Character(id:'WV-030', team:'White Vine', role:'★2 Dew Scribes', name:'Waka', image:'assets/cards1/whitevine1/30.webp', normalImage:'assets/cards2/whitevine2/30.webp', evolvedImage:'assets/cards3/whitevine3/30.webp'),
Character(id:'WV-031', team:'White Vine', role:'★1 White Petals（Back Up）', name:'Shizu', image:'assets/cards1/whitevine1/31.webp', normalImage:'assets/cards2/whitevine2/31.webp', evolvedImage:'assets/cards3/whitevine3/31.webp'),
Character(id:'WV-032', team:'White Vine', role:'★1 White Petals（Back Up）', name:'En', image:'assets/cards1/whitevine1/32.webp', normalImage:'assets/cards2/whitevine2/32.webp', evolvedImage:'assets/cards3/whitevine3/32.webp'),
Character(id:'WV-033', team:'White Vine', role:'★1 White Petals（Back Up）', name:'Ao', image:'assets/cards1/whitevine1/33.webp', normalImage:'assets/cards2/whitevine2/33.webp', evolvedImage:'assets/cards3/whitevine3/33.webp'),
Character(id:'WV-034', team:'White Vine', role:'★1 White Petals（Back Up）', name:'Sayo', image:'assets/cards1/whitevine1/34.webp', normalImage:'assets/cards2/whitevine2/34.webp', evolvedImage:'assets/cards3/whitevine3/34.webp'),
Character(id:'WV-035', team:'White Vine', role:'★1 Seedlings', name:'Kotoha', image:'assets/cards1/whitevine1/35.webp', normalImage:'assets/cards2/whitevine2/35.webp', evolvedImage:'assets/cards3/whitevine3/35.webp'),
Character(id:'WV-036', team:'White Vine', role:'★1 Seedlings', name:'Nana', image:'assets/cards1/whitevine1/36.webp', normalImage:'assets/cards2/whitevine2/36.webp', evolvedImage:'assets/cards3/whitevine3/36.webp'),
Character(id:'WV-037', team:'White Vine', role:'★1 Seedlings', name:'Kohaku', image:'assets/cards1/whitevine1/37.webp', normalImage:'assets/cards2/whitevine2/37.webp', evolvedImage:'assets/cards3/whitevine3/37.webp'),
Character(id:'WV-038', team:'White Vine', role:'★1 Seedlings', name:'Mao', image:'assets/cards1/whitevine1/38.webp', normalImage:'assets/cards2/whitevine2/38.webp', evolvedImage:'assets/cards3/whitevine3/38.webp'),
Character(id:'WV-039', team:'White Vine', role:'★1 Seedlings', name:'Ichi', image:'assets/cards1/whitevine1/39.webp', normalImage:'assets/cards2/whitevine2/39.webp', evolvedImage:'assets/cards3/whitevine3/39.webp'),
Character(id:'WV-040', team:'White Vine', role:'★1 Seedlings', name:'Towa', image:'assets/cards1/whitevine1/40.webp', normalImage:'assets/cards2/whitevine2/40.webp', evolvedImage:'assets/cards3/whitevine3/40.webp'),
Character(id:'WV-041', team:'White Vine', role:'★1 Seedlings', name:'Oruha', image:'assets/cards1/whitevine1/41.webp', normalImage:'assets/cards2/whitevine2/41.webp', evolvedImage:'assets/cards3/whitevine3/41.webp'),

// =========================
// Gold Serpents
// =========================
Character(id:'GS-001', team:'Gold Serpents', role:'★7 Serpent Queen', name:'Vera', image:'assets/cards1/goldserpents1/1.webp', normalImage:'assets/cards2/goldserpents2/1.webp', evolvedImage:'assets/cards3/goldserpents3/1.webp'),
Character(id:'GS-002', team:'Gold Serpents', role:'★6 Coil Regent', name:'Talia', image:'assets/cards1/goldserpents1/2.webp', normalImage:'assets/cards2/goldserpents2/2.webp', evolvedImage:'assets/cards3/goldserpents3/2.webp'),
Character(id:'GS-003', team:'Gold Serpents', role:'★6 Grand Schemer', name:'Karma', image:'assets/cards1/goldserpents1/3.webp', normalImage:'assets/cards2/goldserpents2/3.webp', evolvedImage:'assets/cards3/goldserpents3/3.webp'),
Character(id:'GS-004', team:'Gold Serpents', role:'★5 Oracle of Venom', name:'Nepher', image:'assets/cards1/goldserpents1/4.webp', normalImage:'assets/cards2/goldserpents2/4.webp', evolvedImage:'assets/cards3/goldserpents3/4.webp'),
Character(id:'GS-005', team:'Gold Serpents', role:'★5 Mistress of Contracts', name:'Claire', image:'assets/cards1/goldserpents1/5.webp', normalImage:'assets/cards2/goldserpents2/5.webp', evolvedImage:'assets/cards3/goldserpents3/5.webp'),
Character(id:'GS-006', team:'Gold Serpents', role:'★4 Venom Fang Lieutenants', name:'Sara', image:'assets/cards1/goldserpents1/6.webp', normalImage:'assets/cards2/goldserpents2/6.webp', evolvedImage:'assets/cards3/goldserpents3/6.webp'),
Character(id:'GS-007', team:'Gold Serpents', role:'★4 Venom Fang Lieutenants', name:'Kirara', image:'assets/cards1/goldserpents1/7.webp', normalImage:'assets/cards2/goldserpents2/7.webp', evolvedImage:'assets/cards3/goldserpents3/7.webp'),
Character(id:'GS-008', team:'Gold Serpents', role:'★3 Fang Lieutenants', name:'Nina', image:'assets/cards1/goldserpents1/8.webp', normalImage:'assets/cards2/goldserpents2/8.webp', evolvedImage:'assets/cards3/goldserpents3/8.webp'),
Character(id:'GS-009', team:'Gold Serpents', role:'★3 Fang Lieutenants', name:'Farah', image:'assets/cards1/goldserpents1/9.webp', normalImage:'assets/cards2/goldserpents2/9.webp', evolvedImage:'assets/cards3/goldserpents3/9.webp'),
Character(id:'GS-010', team:'Gold Serpents', role:'★3 Fang Lieutenants', name:'Ashera', image:'assets/cards1/goldserpents1/10.webp', normalImage:'assets/cards2/goldserpents2/10.webp', evolvedImage:'assets/cards3/goldserpents3/10.webp'),
Character(id:'GS-011', team:'Gold Serpents', role:'★3 Fang Lieutenants', name:'Viola', image:'assets/cards1/goldserpents1/11.webp', normalImage:'assets/cards2/goldserpents2/11.webp', evolvedImage:'assets/cards3/goldserpents3/11.webp'),
Character(id:'GS-012', team:'Gold Serpents', role:'★3 Serpent Alchemists', name:'Ange', image:'assets/cards1/goldserpents1/12.webp', normalImage:'assets/cards2/goldserpents2/12.webp', evolvedImage:'assets/cards3/goldserpents3/12.webp'),
Character(id:'GS-013', team:'Gold Serpents', role:'★3 Serpent Alchemists', name:'Cocoa', image:'assets/cards1/goldserpents1/13.webp', normalImage:'assets/cards2/goldserpents2/13.webp', evolvedImage:'assets/cards3/goldserpents3/13.webp'),
Character(id:'GS-014', team:'Gold Serpents', role:'★3 Serpent Alchemists', name:'Mew', image:'assets/cards1/goldserpents1/14.webp', normalImage:'assets/cards2/goldserpents2/14.webp', evolvedImage:'assets/cards3/goldserpents3/14.webp'),
Character(id:'GS-015', team:'Gold Serpents', role:'★3 Serpent Alchemists', name:'Tiara', image:'assets/cards1/goldserpents1/15.webp', normalImage:'assets/cards2/goldserpents2/15.webp', evolvedImage:'assets/cards3/goldserpents3/15.webp'),
Character(id:'GS-016', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Yura', image:'assets/cards1/goldserpents1/16.webp', normalImage:'assets/cards2/goldserpents2/16.webp', evolvedImage:'assets/cards3/goldserpents3/16.webp'),
Character(id:'GS-017', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Roa', image:'assets/cards1/goldserpents1/17.webp', normalImage:'assets/cards2/goldserpents2/17.webp', evolvedImage:'assets/cards3/goldserpents3/17.webp'),
Character(id:'GS-018', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Sol', image:'assets/cards1/goldserpents1/18.webp', normalImage:'assets/cards2/goldserpents2/18.webp', evolvedImage:'assets/cards3/goldserpents3/18.webp'),
Character(id:'GS-019', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Norn', image:'assets/cards1/goldserpents1/19.webp', normalImage:'assets/cards2/goldserpents2/19.webp', evolvedImage:'assets/cards3/goldserpents3/19.webp'),
Character(id:'GS-020', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Isa', image:'assets/cards1/goldserpents1/20.webp', normalImage:'assets/cards2/goldserpents2/20.webp', evolvedImage:'assets/cards3/goldserpents3/20.webp'),
Character(id:'GS-021', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Shiva', image:'assets/cards1/goldserpents1/21.webp', normalImage:'assets/cards2/goldserpents2/21.webp', evolvedImage:'assets/cards3/goldserpents3/21.webp'),
Character(id:'GS-022', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Meifa', image:'assets/cards1/goldserpents1/22.webp', normalImage:'assets/cards2/goldserpents2/22.webp', evolvedImage:'assets/cards3/goldserpents3/22.webp'),
Character(id:'GS-023', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Orina', image:'assets/cards1/goldserpents1/23.webp', normalImage:'assets/cards2/goldserpents2/23.webp', evolvedImage:'assets/cards3/goldserpents3/23.webp'),
Character(id:'GS-024', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Naha', image:'assets/cards1/goldserpents1/24.webp', normalImage:'assets/cards2/goldserpents2/24.webp', evolvedImage:'assets/cards3/goldserpents3/24.webp'),
Character(id:'GS-025', team:'Gold Serpents', role:'★2 Venom Dancers', name:'Liz', image:'assets/cards1/goldserpents1/25.webp', normalImage:'assets/cards2/goldserpents2/25.webp', evolvedImage:'assets/cards3/goldserpents3/25.webp'),
Character(id:'GS-026', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Rena', image:'assets/cards1/goldserpents1/26.webp', normalImage:'assets/cards2/goldserpents2/26.webp', evolvedImage:'assets/cards3/goldserpents3/26.webp'),
Character(id:'GS-027', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Hana', image:'assets/cards1/goldserpents1/27.webp', normalImage:'assets/cards2/goldserpents2/27.webp', evolvedImage:'assets/cards3/goldserpents3/27.webp'),
Character(id:'GS-028', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Sai', image:'assets/cards1/goldserpents1/28.webp', normalImage:'assets/cards2/goldserpents2/28.webp', evolvedImage:'assets/cards3/goldserpents3/28.webp'),
Character(id:'GS-029', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Ruu', image:'assets/cards1/goldserpents1/29.webp', normalImage:'assets/cards2/goldserpents2/29.webp', evolvedImage:'assets/cards3/goldserpents3/29.webp'),
Character(id:'GS-030', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Emma', image:'assets/cards1/goldserpents1/30.webp', normalImage:'assets/cards2/goldserpents2/30.webp', evolvedImage:'assets/cards3/goldserpents3/30.webp'),
Character(id:'GS-031', team:'Gold Serpents', role:'★1 Serpent Agents', name:'Juno', image:'assets/cards1/goldserpents1/31.webp', normalImage:'assets/cards2/goldserpents2/31.webp', evolvedImage:'assets/cards3/goldserpents3/31.webp'),
Character(id:'GS-032', team:'Gold Serpents', role:'★1 Gilded Initiates', name:'Maya', image:'assets/cards1/goldserpents1/32.webp', normalImage:'assets/cards2/goldserpents2/32.webp', evolvedImage:'assets/cards3/goldserpents3/32.webp'),
Character(id:'GS-033', team:'Gold Serpents', role:'★1 Gilded Initiates', name:'Mika', image:'assets/cards1/goldserpents1/33.webp', normalImage:'assets/cards2/goldserpents2/33.webp', evolvedImage:'assets/cards3/goldserpents3/33.webp'),

// =========================
// Ruby Storm
// =========================
Character(id:'RS-001', team:'Ruby Storm', role:'★7 Red Storm Empress', name:'Rosa', image:'assets/cards1/rubystorm1/1.webp', normalImage:'assets/cards2/rubystorm2/1.webp', evolvedImage:'assets/cards3/rubystorm3/1.webp'),
Character(id:'RS-002', team:'Ruby Storm', role:'★6 Crimson Viceroy', name:'Atena', image:'assets/cards1/rubystorm1/2.webp', normalImage:'assets/cards2/rubystorm2/2.webp', evolvedImage:'assets/cards3/rubystorm3/2.webp'),
Character(id:'RS-003', team:'Ruby Storm', role:'★6 Tempest Strategist', name:'Lyra', image:'assets/cards1/rubystorm1/3.webp', normalImage:'assets/cards2/rubystorm2/3.webp', evolvedImage:'assets/cards3/rubystorm3/3.webp'),
Character(id:'RS-004', team:'Ruby Storm', role:'★5 Mistress of Carnage', name:'Scar', image:'assets/cards1/rubystorm1/4.webp', normalImage:'assets/cards2/rubystorm2/4.webp', evolvedImage:'assets/cards3/rubystorm3/4.webp'),
Character(id:'RS-005', team:'Ruby Storm', role:'★5 Blood Syndicate Keeper', name:'Mira', image:'assets/cards1/rubystorm1/5.webp', normalImage:'assets/cards2/rubystorm2/5.webp', evolvedImage:'assets/cards3/rubystorm3/5.webp'),
Character(id:'RS-006', team:'Ruby Storm', role:'★4 Ruby Warlords', name:'Kara', image:'assets/cards1/rubystorm1/6.webp', normalImage:'assets/cards2/rubystorm2/6.webp', evolvedImage:'assets/cards3/rubystorm3/6.webp'),
Character(id:'RS-007', team:'Ruby Storm', role:'★4 Ruby Warlords', name:'Fiona', image:'assets/cards1/rubystorm1/7.webp', normalImage:'assets/cards2/rubystorm2/7.webp', evolvedImage:'assets/cards3/rubystorm3/7.webp'),
Character(id:'RS-008', team:'Ruby Storm', role:'★4 Scarlet Warlords', name:'Rin', image:'assets/cards1/rubystorm1/8.webp', normalImage:'assets/cards2/rubystorm2/8.webp', evolvedImage:'assets/cards3/rubystorm3/8.webp'),
Character(id:'RS-009', team:'Ruby Storm', role:'★4 Scarlet Warlords', name:'Elza', image:'assets/cards1/rubystorm1/9.webp', normalImage:'assets/cards2/rubystorm2/9.webp', evolvedImage:'assets/cards3/rubystorm3/9.webp'),
Character(id:'RS-010', team:'Ruby Storm', role:'★3 Scarlet Reapers', name:'Nina', image:'assets/cards1/rubystorm1/10.webp', normalImage:'assets/cards2/rubystorm2/10.webp', evolvedImage:'assets/cards3/rubystorm3/10.webp'),
Character(id:'RS-011', team:'Ruby Storm', role:'★3 Scarlet Reapers', name:'Valk', image:'assets/cards1/rubystorm1/11.webp', normalImage:'assets/cards2/rubystorm2/11.webp', evolvedImage:'assets/cards3/rubystorm3/11.webp'),
Character(id:'RS-012', team:'Ruby Storm', role:'★3 Scarlet Reapers', name:'Rhea', image:'assets/cards1/rubystorm1/12.webp', normalImage:'assets/cards2/rubystorm2/12.webp', evolvedImage:'assets/cards3/rubystorm3/12.webp'),
Character(id:'RS-013', team:'Ruby Storm', role:'★3 Scarlet Reapers', name:'Sera', image:'assets/cards1/rubystorm1/13.webp', normalImage:'assets/cards2/rubystorm2/13.webp', evolvedImage:'assets/cards3/rubystorm3/13.webp'),
Character(id:'RS-014', team:'Ruby Storm', role:'★3 Riot Breakhers', name:'Bree', image:'assets/cards1/rubystorm1/14.webp', normalImage:'assets/cards2/rubystorm2/14.webp', evolvedImage:'assets/cards3/rubystorm3/14.webp'),
Character(id:'RS-015', team:'Ruby Storm', role:'★3 Riot Breakhers', name:'Jolt', image:'assets/cards1/rubystorm1/15.webp', normalImage:'assets/cards2/rubystorm2/15.webp', evolvedImage:'assets/cards3/rubystorm3/15.webp'),
Character(id:'RS-016', team:'Ruby Storm', role:'★2 Riot Breakhers', name:'Dash', image:'assets/cards1/rubystorm1/16.webp', normalImage:'assets/cards2/rubystorm2/16.webp', evolvedImage:'assets/cards3/rubystorm3/16.webp'),
Character(id:'RS-017', team:'Ruby Storm', role:'★2 Riot Breakhers', name:'Clash', image:'assets/cards1/rubystorm1/17.webp', normalImage:'assets/cards2/rubystorm2/17.webp', evolvedImage:'assets/cards3/rubystorm3/17.webp'),
Character(id:'RS-018', team:'Ruby Storm', role:'★2 Crimson Phantoms', name:'Shado', image:'assets/cards1/rubystorm1/18.webp', normalImage:'assets/cards2/rubystorm2/18.webp', evolvedImage:'assets/cards3/rubystorm3/18.webp'),
Character(id:'RS-019', team:'Ruby Storm', role:'★2 Crimson Phantoms', name:'Nyra', image:'assets/cards1/rubystorm1/19.webp', normalImage:'assets/cards2/rubystorm2/19.webp', evolvedImage:'assets/cards3/rubystorm3/19.webp'),
Character(id:'RS-020', team:'Ruby Storm', role:'★2 Crimson Phantoms', name:'Vivienne', image:'assets/cards1/rubystorm1/20.webp', normalImage:'assets/cards2/rubystorm2/20.webp', evolvedImage:'assets/cards3/rubystorm3/20.webp'),
Character(id:'RS-021', team:'Ruby Storm', role:'★1 Red Pulse Unit', name:'Echor', image:'assets/cards1/rubystorm1/21.webp', normalImage:'assets/cards2/rubystorm2/21.webp', evolvedImage:'assets/cards3/rubystorm3/21.webp'),
Character(id:'RS-022', team:'Ruby Storm', role:'★1 Red Pulse Unit', name:'Lumi', image:'assets/cards1/rubystorm1/22.webp', normalImage:'assets/cards2/rubystorm2/22.webp', evolvedImage:'assets/cards3/rubystorm3/22.webp'),
Character(id:'RS-023', team:'Ruby Storm', role:'★1 Storm Veterans', name:'Hel', image:'assets/cards1/rubystorm1/23.webp', normalImage:'assets/cards2/rubystorm2/23.webp', evolvedImage:'assets/cards3/rubystorm3/23.webp'),
Character(id:'RS-024', team:'Ruby Storm', role:'★1 Storm Veterans', name:'Rox', image:'assets/cards1/rubystorm1/24.webp', normalImage:'assets/cards2/rubystorm2/24.webp', evolvedImage:'assets/cards3/rubystorm3/24.webp'),
Character(id:'RS-025', team:'Ruby Storm', role:'★1 Storm Veterans', name:'Gina', image:'assets/cards1/rubystorm1/25.webp', normalImage:'assets/cards2/rubystorm2/25.webp', evolvedImage:'assets/cards3/rubystorm3/25.webp'),
Character(id:'RS-026', team:'Ruby Storm', role:'★1 Storm Veterans', name:'Mona', image:'assets/cards1/rubystorm1/26.webp', normalImage:'assets/cards2/rubystorm2/26.webp', evolvedImage:'assets/cards3/rubystorm3/26.webp'),
Character(id:'RS-027', team:'Ruby Storm', role:'★1 Blood Initiates', name:'Pia', image:'assets/cards1/rubystorm1/27.webp', normalImage:'assets/cards2/rubystorm2/27.webp', evolvedImage:'assets/cards3/rubystorm3/27.webp'),
Character(id:'RS-028', team:'Ruby Storm', role:'★1 Blood Initiates', name:'Nora', image:'assets/cards1/rubystorm1/28.webp', normalImage:'assets/cards2/rubystorm2/28.webp', evolvedImage:'assets/cards3/rubystorm3/28.webp'),
Character(id:'RS-029', team:'Ruby Storm', role:'★1 Blood Initiates', name:'Tess', image:'assets/cards1/rubystorm1/29.webp', normalImage:'assets/cards2/rubystorm2/29.webp', evolvedImage:'assets/cards3/rubystorm3/29.webp'),
Character(id:'RS-030', team:'Ruby Storm', role:'★1 Blood Initiates', name:'Ivy', image:'assets/cards1/rubystorm1/30.webp', normalImage:'assets/cards2/rubystorm2/30.webp', evolvedImage:'assets/cards3/rubystorm3/30.webp'),

// =========================
// Blue Blood
// =========================
Character(id:'BB-001', team:'Blue Blood', role:'★7 Azure Queen', name:'Lunaria', image:'assets/cards1/blueblood1/1.webp', normalImage:'assets/cards2/blueblood2/1.webp', evolvedImage:'assets/cards3/blueblood3/1.webp'),
Character(id:'BB-002', team:'Blue Blood', role:'★6 Azure Rook', name:'Reina', image:'assets/cards1/blueblood1/2.webp', normalImage:'assets/cards2/blueblood2/2.webp', evolvedImage:'assets/cards3/blueblood3/2.webp'),
Character(id:'BB-003', team:'Blue Blood', role:'★6 Azure Rook', name:'Belna', image:'assets/cards1/blueblood1/3.webp', normalImage:'assets/cards2/blueblood2/3.webp', evolvedImage:'assets/cards3/blueblood3/3.webp'),
Character(id:'BB-004', team:'Blue Blood', role:'★5 Azure Bishop', name:'Ciel', image:'assets/cards1/blueblood1/4.webp', normalImage:'assets/cards2/blueblood2/4.webp', evolvedImage:'assets/cards3/blueblood3/4.webp'),
Character(id:'BB-005', team:'Blue Blood', role:'★5 Azure Bishop', name:'Nadia', image:'assets/cards1/blueblood1/5.webp', normalImage:'assets/cards2/blueblood2/5.webp', evolvedImage:'assets/cards3/blueblood3/5.webp'),
Character(id:'BB-006', team:'Blue Blood', role:'★4 Azure Knight', name:'Kyra', image:'assets/cards1/blueblood1/6.webp', normalImage:'assets/cards2/blueblood2/6.webp', evolvedImage:'assets/cards3/blueblood3/6.webp'),
Character(id:'BB-007', team:'Blue Blood', role:'★4 Azure Knight', name:'Arias', image:'assets/cards1/blueblood1/7.webp', normalImage:'assets/cards2/blueblood2/7.webp', evolvedImage:'assets/cards3/blueblood3/7.webp'),
Character(id:'BB-008', team:'Blue Blood', role:'★4 Azure Pawn', name:'Az', image:'assets/cards1/blueblood1/8.webp', normalImage:'assets/cards2/blueblood2/8.webp', evolvedImage:'assets/cards3/blueblood3/8.webp'),
Character(id:'BB-009', team:'Blue Blood', role:'★4 Azure Pawn', name:'Riona', image:'assets/cards1/blueblood1/9.webp', normalImage:'assets/cards2/blueblood2/9.webp', evolvedImage:'assets/cards3/blueblood3/9.webp'),
Character(id:'BB-010', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Fiora', image:'assets/cards1/blueblood1/10.webp', normalImage:'assets/cards2/blueblood2/10.webp', evolvedImage:'assets/cards3/blueblood3/10.webp'),
Character(id:'BB-011', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Nox', image:'assets/cards1/blueblood1/11.webp', normalImage:'assets/cards2/blueblood2/11.webp', evolvedImage:'assets/cards3/blueblood3/11.webp'),
Character(id:'BB-012', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Elsia', image:'assets/cards1/blueblood1/12.webp', normalImage:'assets/cards2/blueblood2/12.webp', evolvedImage:'assets/cards3/blueblood3/12.webp'),
Character(id:'BB-013', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Eve', image:'assets/cards1/blueblood1/13.webp', normalImage:'assets/cards2/blueblood2/13.webp', evolvedImage:'assets/cards3/blueblood3/13.webp'),
Character(id:'BB-014', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Mirage', image:'assets/cards1/blueblood1/14.webp', normalImage:'assets/cards2/blueblood2/14.webp', evolvedImage:'assets/cards3/blueblood3/14.webp'),
Character(id:'BB-015', team:'Blue Blood', role:'★3 Cerulean Pawn', name:'Solenne', image:'assets/cards1/blueblood1/15.webp', normalImage:'assets/cards2/blueblood2/15.webp', evolvedImage:'assets/cards3/blueblood3/15.webp'),

// =========================
// 紫焔 – Shien
// =========================
Character(id:'SH-001', team:'紫焔 – Shien', role:'★7 Flame Oracle', name:'Shion', image:'assets/cards1/shien1/1.webp', normalImage:'assets/cards2/shien2/1.webp', evolvedImage:'assets/cards3/shien3/1.webp'),
Character(id:'SH-002', team:'紫焔 – Shien', role:'★6 Violet Sovereign', name:'Kagari', image:'assets/cards1/shien1/2.webp', normalImage:'assets/cards2/shien2/2.webp', evolvedImage:'assets/cards3/shien3/2.webp'),
Character(id:'SH-003', team:'紫焔 – Shien', role:'★6 Ember Binder', name:'Enma', image:'assets/cards1/shien1/3.webp', normalImage:'assets/cards2/shien2/3.webp', evolvedImage:'assets/cards3/shien3/3.webp'),
Character(id:'SH-004', team:'紫焔 – Shien', role:'★5 Chrono Seer', name:'Toki', image:'assets/cards1/shien1/4.webp', normalImage:'assets/cards2/shien2/4.webp', evolvedImage:'assets/cards3/shien3/4.webp'),
Character(id:'SH-005', team:'紫焔 – Shien', role:'★5 Violet Archivist', name:'Ren', image:'assets/cards1/shien1/5.webp', normalImage:'assets/cards2/shien2/5.webp', evolvedImage:'assets/cards3/shien3/5.webp'),
Character(id:'SH-006', team:'紫焔 – Shien', role:'★4 Ash Blades', name:'Ayame', image:'assets/cards1/shien1/6.webp', normalImage:'assets/cards2/shien2/6.webp', evolvedImage:'assets/cards3/shien3/6.webp'),
Character(id:'SH-007', team:'紫焔 – Shien', role:'★4 Ash Blades', name:'Yoru', image:'assets/cards1/shien1/7.webp', normalImage:'assets/cards2/shien2/7.webp', evolvedImage:'assets/cards3/shien3/7.webp'),
Character(id:'SH-008', team:'紫焔 – Shien', role:'★3 Night Flame', name:'Mahina', image:'assets/cards1/shien1/8.webp', normalImage:'assets/cards2/shien2/8.webp', evolvedImage:'assets/cards3/shien3/8.webp'),
Character(id:'SH-009', team:'紫焔 – Shien', role:'★3 Spirit Medium', name:'Murasaki', image:'assets/cards1/shien1/9.webp', normalImage:'assets/cards2/shien2/9.webp', evolvedImage:'assets/cards3/shien3/9.webp'),

// =========================
// Shadows
// =========================
Character(id:'SD-001', team:'Shadows', role:'★7 Abyss', name:'Noir', image:'assets/cards1/shadows1/1.webp', normalImage:'assets/cards2/shadows2/1.webp', evolvedImage:'assets/cards3/shadows3/1.webp'),
Character(id:'SD-002', team:'Shadows', role:'★6 Void', name:'Zero', image:'assets/cards1/shadows1/2.webp', normalImage:'assets/cards2/shadows2/2.webp', evolvedImage:'assets/cards3/shadows3/2.webp'),
Character(id:'SD-003', team:'Shadows', role:'★6 Void', name:'Echo', image:'assets/cards1/shadows1/3.webp', normalImage:'assets/cards2/shadows2/3.webp', evolvedImage:'assets/cards3/shadows3/3.webp'),
Character(id:'SD-004', team:'Shadows', role:'★6 Void', name:'Vail', image:'assets/cards1/shadows1/4.webp', normalImage:'assets/cards2/shadows2/4.webp', evolvedImage:'assets/cards3/shadows3/4.webp'),
Character(id:'SD-005', team:'Shadows', role:'★6 Void', name:'Morn', image:'assets/cards1/shadows1/5.webp', normalImage:'assets/cards2/shadows2/5.webp', evolvedImage:'assets/cards3/shadows3/5.webp'),
Character(id:'SD-006', team:'Shadows', role:'★5 Eclipse', name:'Shade', image:'assets/cards1/shadows1/6.webp', normalImage:'assets/cards2/shadows2/6.webp', evolvedImage:'assets/cards3/shadows3/6.webp'),
Character(id:'SD-007', team:'Shadows', role:'★5 Eclipse', name:'Lurk', image:'assets/cards1/shadows1/7.webp', normalImage:'assets/cards2/shadows2/7.webp', evolvedImage:'assets/cards3/shadows3/7.webp'),
Character(id:'SD-008', team:'Shadows', role:'★5 Eclipse', name:'Ash', image:'assets/cards1/shadows1/8.webp', normalImage:'assets/cards2/shadows2/8.webp', evolvedImage:'assets/cards3/shadows3/8.webp'),
Character(id:'SD-009', team:'Shadows', role:'★5 Eclipse', name:'Blur', image:'assets/cards1/shadows1/9.webp', normalImage:'assets/cards2/shadows2/9.webp', evolvedImage:'assets/cards3/shadows3/9.webp'),
Character(id:'SD-010', team:'Shadows', role:'★5 Eclipse', name:'Nix', image:'assets/cards1/shadows1/10.webp', normalImage:'assets/cards2/shadows2/10.webp', evolvedImage:'assets/cards3/shadows3/10.webp'),
Character(id:'SD-011', team:'Shadows', role:'★5 Eclipse', name:'Gloom', image:'assets/cards1/shadows1/11.webp', normalImage:'assets/cards2/shadows2/11.webp', evolvedImage:'assets/cards3/shadows3/11.webp'),
Character(id:'SD-012', team:'Shadows', role:'★5 Eclipse', name:'Wisp', image:'assets/cards1/shadows1/12.webp', normalImage:'assets/cards2/shadows2/12.webp', evolvedImage:'assets/cards3/shadows3/12.webp'),
Character(id:'SD-013', team:'Shadows', role:'★5 Eclipse', name:'Haze', image:'assets/cards1/shadows1/13.webp', normalImage:'assets/cards2/shadows2/13.webp', evolvedImage:'assets/cards3/shadows3/13.webp'),
Character(id:'SD-014', team:'Shadows', role:'★5 Eclipse', name:'Crow', image:'assets/cards1/shadows1/14.webp', normalImage:'assets/cards2/shadows2/14.webp', evolvedImage:'assets/cards3/shadows3/14.webp'),
Character(id:'SD-015', team:'Shadows', role:'★5 Eclipse', name:'Mute', image:'assets/cards1/shadows1/15.webp', normalImage:'assets/cards2/shadows2/15.webp', evolvedImage:'assets/cards3/shadows3/15.webp'),
Character(id:'SD-016', team:'Shadows', role:'★5 Eclipse', name:'Faint', image:'assets/cards1/shadows1/16.webp', normalImage:'assets/cards2/shadows2/16.webp', evolvedImage:'assets/cards3/shadows3/16.webp'),
Character(id:'SD-017', team:'Shadows', role:'★5 Eclipse', name:'Drip', image:'assets/cards1/shadows1/17.webp', normalImage:'assets/cards2/shadows2/17.webp', evolvedImage:'assets/cards3/shadows3/17.webp'),
Character(id:'SD-018', team:'Shadows', role:'★5 Eclipse', name:'Dusk', image:'assets/cards1/shadows1/18.webp', normalImage:'assets/cards2/shadows2/18.webp', evolvedImage:'assets/cards3/shadows3/18.webp'),

// =========================
// Nomad
// =========================
Character(id:'NM-001', team:'Nomad', role:'★6 Ability Users', name:'Flux', image:'assets/cards1/nomad1/1.webp', normalImage:'assets/cards2/nomad2/1.webp', evolvedImage:'assets/cards3/nomad3/1.webp'),
Character(id:'NM-002', team:'Nomad', role:'★6 Ability Users', name:'Shift', image:'assets/cards1/nomad1/2.webp', normalImage:'assets/cards2/nomad2/2.webp', evolvedImage:'assets/cards3/nomad3/2.webp'),
Character(id:'NM-003', team:'Nomad', role:'★6 Ability Users', name:'Blink', image:'assets/cards1/nomad1/3.webp', normalImage:'assets/cards2/nomad2/3.webp', evolvedImage:'assets/cards3/nomad3/3.webp'),
Character(id:'NM-004', team:'Nomad', role:'★6 Ability Users', name:'Warp', image:'assets/cards1/nomad1/4.webp', normalImage:'assets/cards2/nomad2/4.webp', evolvedImage:'assets/cards3/nomad3/4.webp'),
Character(id:'NM-005', team:'Nomad', role:'★6 Ability Users', name:'Drift', image:'assets/cards1/nomad1/5.webp', normalImage:'assets/cards2/nomad2/5.webp', evolvedImage:'assets/cards3/nomad3/5.webp'),
Character(id:'NM-006', team:'Nomad', role:'★6 Ability Users', name:'Phase', image:'assets/cards1/nomad1/6.webp', normalImage:'assets/cards2/nomad2/6.webp', evolvedImage:'assets/cards3/nomad3/6.webp'),
Character(id:'NM-007', team:'Nomad', role:'★6 Ability Users', name:'Glitch', image:'assets/cards1/nomad1/7.webp', normalImage:'assets/cards2/nomad2/7.webp', evolvedImage:'assets/cards3/nomad3/7.webp'),
];